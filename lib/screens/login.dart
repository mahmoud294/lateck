import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPass = '';
  @override
  Widget build(BuildContext context) {
    void _trySubmit() {
      final isValid = _formKey.currentState.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        _formKey.currentState.save();
      }
    }

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
          decoration: BoxDecoration(color: Colors.blue[900]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    _isLogin ? 'Login' : 'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'E-mail',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    key: ValueKey('email'),
                                    onSaved: (value) {
                                      _userEmail = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Please Enter Valid Email !';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),),
                                        
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (!_isLogin)
                                    Column(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Full Name',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          key: ValueKey('username'),
                                          onSaved: (value) {
                                            _userName = value;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty ||
                                                value.length < 4) {
                                              return 'Please Enter at least 4 Characters !';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Username',
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Password',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    key: ValueKey('password'),
                                    onSaved: (value) {
                                      _userPass = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty || value.length < 7) {
                                        return 'Password must be at least 7 Characters !';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 80,
                              width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        padding: EdgeInsets.all(10),
                                        child: _isLogin
                                            ? Text('Login',style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),)
                                            : Text('Creat New Account',style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),),
                                        onPressed: _trySubmit,
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    textColor: Theme.of(context).primaryColor,
                                    child: !_isLogin
                                        ? Text('Login',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),)
                                        : Text('Creat New Account',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),),
                                    onPressed: () {
                                      setState(() {
                                        _isLogin = !_isLogin;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
