import 'package:flutter/material.dart';

class TestController extends StatefulWidget {
  final String username;
  final String mail;
  final String password;

  TestController({Key key, this.username, this.mail, this.password}) : super(key: key);
  @override
  _TestControllerState createState() => _TestControllerState();
}

class _TestControllerState extends State<TestController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Test Page'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), color: Colors.white,onPressed: (){},),
          new IconButton(icon: Icon(Icons.add), color:Colors.white,onPressed: (){},),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Text('${widget.username}, ${widget.password}, ${widget.mail}'),

        ],
      ),
    );
  }
}
