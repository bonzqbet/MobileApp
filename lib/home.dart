import 'package:flutter/material.dart';
import 'package:project_mobile/main.dart';

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EIEI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}
class SampleAppPage extends StatefulWidget {
  @override
  Derdahtv createState() => Derdahtv();
}
class Derdahtv extends State<SampleAppPage> {
  final formkey = GlobalKey<FormState>();
  String textt = 'Welcome to MyApp naja';
  // Default placeholder text
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            var rount =
                MaterialPageRoute(builder: (BuildContext contex) => MyApp());
            Navigator.of(context).push(rount);
          },
        ),centerTitle: true,
        title: Text('derdahtv.dev'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Stack(
          children: <Widget>[update(),],
        ),
      ),
    );
  }
  Widget update() {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Center(child: Text(textt)),
    );
  }
}