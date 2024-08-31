import 'package:flutter/material.dart';
import 'package:flutter_lab1/controller/auth_service.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  String _selectedRole = ''; // Initialize with a default value


  void _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      print('Name : ${_NameController.text}');
      print('Username : ${_usernameController.text}');
      print('Passwrod : ${_passwordController.text}');
      print('Role: $_selectedRole');
      try{
     await AuthService().register(_NameController.text,_usernameController.text, _passwordController.text,_roleController.text);

     ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registeration successful'))
     );
      }catch (e){
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registeration failed'))
       );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _NameController,
            decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            //onChanged: (value) {
              //setState(() {
                //Name = value;
              //});
            //},
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            //onChanged: (value) {
              //setState(() {
                //_userName = value;
              //});
            //},
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            // onChanged: (value) {
            //   setState(() {
            //     _password = value;
            //   });
            // },
          ),
          SizedBox(height: 16.0),
          //Text('Role:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            children: <Widget>[
              ChoiceChip(
                label: Text('User'),
                selected: _selectedRole == 'User',
                selectedColor: Colors.blueAccent,
                backgroundColor: Colors.grey[200],
                labelStyle: TextStyle(color: _selectedRole == 'User' ? Colors.white : Colors.black),
                onSelected: (selected) {
                  setState(() {
                    _selectedRole = 'User';
                  });
                },
              ),
              ChoiceChip(
                label: Text('Admin'),
                selected: _selectedRole == 'Admin',
                selectedColor: Colors.blueAccent,
                backgroundColor: Colors.grey[200],
                labelStyle: TextStyle(color: _selectedRole == 'Admin' ? Colors.white : Colors.black),
                onSelected: (selected) {
                  setState(() {
                    _selectedRole = 'Admin';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _register,
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
