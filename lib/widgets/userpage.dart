import 'package:flutter/material.dart';
import 'package:flutter_lab1/widgets/login_form.dart'; // ตรวจสอบเส้นทาง
import 'package:shared_preferences/shared_preferences.dart';

class UserWelcomePage extends StatefulWidget {
  const UserWelcomePage({super.key});
  @override
  _UserWelcomePage createState() => _UserWelcomePage();
}

class _UserWelcomePage extends State<UserWelcomePage> {
  String? myname;
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myname");
    });
  }

  void remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('myname');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          myname ?? "รอสักครู่...",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: remove,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ProDuct',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0), // ระยะห่างระหว่างข้อความและตาราง
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 35.0, // ระยะห่างระหว่างคอลัมน์
                  headingRowColor: MaterialStateProperty.all(
                      Colors.grey[200]), // สีพื้นหลังของหัวข้อคอลัมน์
                  dataRowColor: MaterialStateProperty.all(
                      Colors.white), // สีพื้นหลังของเซลล์ข้อมูล
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ), // รูปแบบของข้อความในหัวข้อคอลัมน์
                  dataTextStyle: const TextStyle(
                    color: Colors.black,
                  ), // รูปแบบของข้อความในเซลล์ข้อมูล
                  border: TableBorder.all(
                    color: Colors.black, // สีของเส้นกรอบ
                    width: 1.0, // ความหนาของเส้นกรอบ
                  ),
                  columns: const <DataColumn>[
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('ชื่อ')),
                    DataColumn(label: Text('ประเภท')),
                    DataColumn(label: Text('ราคา')),
                    DataColumn(label: Text('จำนวน')),
                  ],
                  rows: const <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('ข้าว')),
                      DataCell(Text('อาหาร')),
                      DataCell(Text('100')),
                      DataCell(Text('500กรัม')),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
