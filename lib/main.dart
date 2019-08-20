import 'package:flutter/material.dart';
import 'package:voyce_app/start_page/firstpage.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoyceApp',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new FirstPage(),

    );
  }
}

