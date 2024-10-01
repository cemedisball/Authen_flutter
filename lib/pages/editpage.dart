import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _Editpage createState() => _Editpage();
}

class _Editpage extends State<EditPage> {
  String? myname;

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myname");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myname ?? "รอสักครู่"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Edit Product",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'ชื่อ',
                filled: true,
                fillColor: Colors.white, // สีพื้นหลังของช่องป้อนข้อมูล
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // ขอบช่องป้อนข้อมูล
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // ขอบช่องป้อนข้อมูลเมื่อโฟกัส
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'ประเภท',
                filled: true,
                fillColor: Colors.white, // สีพื้นหลังของช่องป้อนข้อมูล
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // ขอบช่องป้อนข้อมูล
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // ขอบช่องป้อนข้อมูลเมื่อโฟกัส
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'ราคา',
                filled: true,
                fillColor: Colors.white, // สีพื้นหลังของช่องป้อนข้อมูล
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // ขอบช่องป้อนข้อมูล
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // ขอบช่องป้อนข้อมูลเมื่อโฟกัส
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'จำนวน',
                filled: true,
                fillColor: Colors.white, // สีพื้นหลังของช่องป้อนข้อมูล
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // ขอบช่องป้อนข้อมูล
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // ขอบช่องป้อนข้อมูลเมื่อโฟกัส
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // ปุ่มบันทึกยังไม่ได้เชื่อมโยงกับการทำงานจริง
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                textStyle: const TextStyle(
                  fontSize: 18.0, // ขนาดของข้อความในปุ่ม
                ),
              ),
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
