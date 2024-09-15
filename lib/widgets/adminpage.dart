import 'package:flutter/material.dart';
import 'package:flutter_lab1/widgets/addpage.dart';
import 'package:flutter_lab1/widgets/editpage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADMIN'),
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
            const SizedBox(height: 15.0), // ระยะห่างระหว่างข้อความและปุ่ม
            Align(
              alignment: Alignment.centerLeft, // จัดตำแหน่งปุ่มให้ชิดซ้าย
              child: SizedBox(
                width: 100.0, // กำหนดความกว้างของปุ่ม
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // ขอบโค้งมน
                    ),
                    padding: EdgeInsets.zero, // ตั้งค่า padding เป็น 0
                    minimumSize: Size(100, 50), // ขนาดขั้นต่ำของปุ่ม
                    textStyle: const TextStyle(
                      fontSize: 25.0, // ขนาดของข้อความในปุ่ม
                    ),
                  ),
                  child:
                      const Text('Add', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 15.0), // ระยะห่างระหว่างปุ่มและตาราง
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 10.0, // ระยะห่างระหว่างคอลัมน์
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
                    DataColumn(
                        label: Text(
                            'Actions')), // คอลัมน์สำหรับปุ่ม Edit และ Delete
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
                                        builder: (context) => EditPage()));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม Delete
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Delete button pressed')),
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
