import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _password = '';
  String _name = '';
  String _selectedRole = 'User'; // ค่าเริ่มต้น

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registering with $_userName and role $_selectedRole')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
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
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
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
            onChanged: (value) {
              setState(() {
                _userName = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
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
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
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
