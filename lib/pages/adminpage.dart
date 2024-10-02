import 'package:flutter/material.dart';
import 'package:flutter_lab1/controller/auth_service.dart';
import 'package:flutter_lab1/controller/product_service.dart';
import 'package:flutter_lab1/pages/addpage.dart';
import 'package:flutter_lab1/pages/editpage.dart';
import 'package:flutter_lab1/providers/user_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lab1/models/product_model.dart';
import 'package:flutter_lab1/controller/product_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Future<List<ProductModel>>? futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().fetchProducts(context);
  }

  void refreshProducts() {
    setState(() {
      futureProducts = ProductService().fetchProducts(context);
    });
  }

  void _logout() async {
    try {
      await AuthService().logout(context);
      // นำผู้ใช้กลับไปยังหน้าล็อกอิน
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer<UserProvider>(builder: (context, userProvider, _) {
    //   if (!userProvider.isAdmin) {
    //     return Center(child: Text('Access Denied'));
    //   }

    return Scaffold(
      appBar: AppBar(
        title: Text("ADMIN"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Access Token : ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('${userProvider.accessToken}',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 15),
                const Text(
                  'Refresh Token : ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('${userProvider.RefreshToken}',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    AuthService().refreshToken(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff821131)),
                  child: Text('Update Token',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 15.0),
                const Text('Products',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddPage()),
                      );

                      if (result == true) {
                        refreshProducts();
                      }
                    },
                    child: Text('Add Product'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 132, 217, 243),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                FutureBuilder<List<ProductModel>>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No products available.'));
                    }

                    final products = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.0),
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ID: ${products[index].id}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  SizedBox(height: 5),
                                  Text('ชื่อ: ${products[index].productName}',
                                      style: TextStyle(fontSize: 18)),
                                  SizedBox(height: 5),
                                  Text('ประเภท: ${products[index].productType}',
                                      style: TextStyle(fontSize: 18)),
                                  SizedBox(height: 5),
                                  Text('ราคา: ${products[index].price}',
                                      style: TextStyle(fontSize: 18)),
                                  SizedBox(height: 5),
                                  Text('จำนวน: ${products[index].unit}',
                                      style: TextStyle(fontSize: 18)),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.blue),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditPage(
                                                  product: products[index]),
                                            ),
                                          ).then((value) {
                                            if (value == true) {
                                              refreshProducts(); // รีเฟรชข้อมูลเมื่อกลับมาจากหน้าจอแก้ไข
                                            }
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Confirm Delete"),
                                                content: Text(
                                                    "Are you sure you want to delete this product?"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // ปิด dialog
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("Delete"),
                                                    onPressed: () async {
                                                      final isDeleted =
                                                          await ProductService()
                                                              .deleteProduct(
                                                                  context,
                                                                  products[
                                                                          index]
                                                                      .id);
                                                      if (isDeleted) {
                                                        refreshProducts();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                              content: Text(
                                                                  'Product deleted successfully')),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                              content: Text(
                                                                  'Failed to delete product')),
                                                        );
                                                      }
                                                      Navigator.of(context)
                                                          .pop(); // ปิด dialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  //);
}
//}
