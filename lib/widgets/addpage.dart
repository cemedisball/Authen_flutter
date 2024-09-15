import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  // ตัวแปรเพื่อเก็บข้อมูลที่ป้อน
  //final TextEditingController _nameController = TextEditingController();
  ///final TextEditingController _typeController = TextEditingController();
  //final TextEditingController _priceController = TextEditingController();
  //final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                //controller: _nameController,
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
                //validator: (value) {
                //if (value == null || value.isEmpty) {
                //return 'กรุณากรอกชื่อ';
                //}
                //return null;
                //},
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                //controller: _typeController,
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
                //validator: (value) {
                //if (value == null || value.isEmpty) {
                //return 'กรุณากรอกประเภท';
                //}
                //return null;
                //},
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                //controller: _priceController,
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
                //keyboardType: TextInputType.number,
                //validator: (value) {
                //if (value == null || value.isEmpty) {
                //return 'กรุณากรอกราคา';
                //}
                //return null;
                //},
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                //controller: _quantityController,
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
                keyboardType: TextInputType.number,
                //validator: (value) {
                //if (value == null || value.isEmpty) {
                //return 'กรุณากรอกจำนวน';
                //}
                //return null;
                //},
              ),
              const SizedBox(height: 30.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //if (_formKey.currentState?.validate() ?? false) {
                    // ถ้าข้อมูลถูกต้อง ให้ทำการจัดการข้อมูลที่กรอก
                    // คุณสามารถนำข้อมูลไปใช้งานหรือส่งไปที่เซิร์ฟเวอร์ที่นี่
                    //ScaffoldMessenger.of(context).showSnackBar(
                    //const SnackBar(content: Text('Processing Data')),
                    //);
                    //}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // ขอบโค้งมน
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0), // ขนาดของปุ่ม
                    textStyle: const TextStyle(
                      fontSize: 18.0, // ขนาดของข้อความในปุ่ม
                    ),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
