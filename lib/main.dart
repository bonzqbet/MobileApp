import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyLoginPage(),
      );
    }
  }
class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key}) : super(key: key);
  
 
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}
 
class _MyLoginPageState extends State<MyLoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  String email,password;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login App", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            color: Colors.green[200],
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.yellow[200], Colors.red[200]])),
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildTextFieldEmail(),
                      buildTextFieldPassword(),
                      buttonSinIn(),
                    ],
                  )),
            )));
  }
  Container buttonSinIn(){
    return Container(
      child: ClipRRect(
        //ลดเหลี่ยมปุ่ม
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          color: Colors.redAccent[700],
          onPressed: () {
            checkAuthe();
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ));
  }
 
  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) => email = value.trim(),
            decoration: InputDecoration.collapsed(hintText: "email"),
            style: TextStyle(fontSize: 18)));
            
  }
 
  Container buildTextFieldPassword() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
          onChanged: (value) => password = value.trim(),
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "password"),
            style: TextStyle(fontSize: 18)));
  }
  Future<void> checkAuthe() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: email, password: password)
        .then((response) {
      print('Login Successfully');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => SampleApp());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      print('Login Fail: please check user or passord');
    });
  }
}


