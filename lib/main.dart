// mssv :1621050335
// nguyentatloc

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameError = "Tài khoản không hợp lệ";
  var _passError = "Mật khẩu phải trên 6 kí tự";
  var _userInvaild = false;
  var _passInvaild = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(115),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                    child: FlutterLogo()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "Đăng Nhập Ngay!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                      labelText: "Tài Khoản",
                      errorText: _userInvaild ? _userNameError : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 13)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          labelText: "Mật Khẩu",
                          errorText: _passInvaild ? _passError : null,
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 13)),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        _showPass ? "Ẩn" : "Hiện",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: onSignInClicked,
                    child: Text(
                      "Đăng Nhập ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Tài khoản mới ? Đăng ký",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      "Quên Mật Khẩu",
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvaild = true;
      } else {
        _userInvaild = false;
      }
      if (_passController.text.length < 6) {
        _passInvaild = true;
      } else {
        _passInvaild = false;
      }
      if (!_userInvaild && !_passInvaild) {
        Navigator.push(context, MaterialPageRoute(builder: gotoHome));
      }
    });
  }

  Widget gotoHome(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Trang chính';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Bản đồ'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Ảnh'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Điện Thoại'),
            ),
          ],
        ),
      ),
    );
  }
}
