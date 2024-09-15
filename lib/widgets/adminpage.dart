import 'package:flutter/material.dart';
import 'package:flutter_lab1/widgets/addpage.dart';
import 'package:flutter_lab1/widgets/editpage.dart';
import 'package:flutter_lab1/widgets/login_form.dart'; // ตรวจสอบเส้นทาง
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
            const SizedBox(height: 15.0),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.zero,
                    minimumSize: Size(100, 50),
                    textStyle: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 10.0,
                  headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                  dataRowColor: MaterialStateProperty.all(Colors.white),
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  dataTextStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: TableBorder.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  columns: const <DataColumn>[
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('ชื่อ')),
                    DataColumn(label: Text('ประเภท')),
                    DataColumn(label: Text('ราคา')),
                    DataColumn(label: Text('จำนวน')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('ข้าว')),
                      DataCell(Text('อาหาร')),
                      DataCell(Text('100')),
                      DataCell(Text('500กรัม')),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPage()),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Delete button pressed'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
