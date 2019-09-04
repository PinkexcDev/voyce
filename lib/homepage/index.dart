import 'package:flutter/material.dart';
import 'package:app_voyce/homepage/recommended.dart';
import 'package:app_voyce/start_page/view_profile.dart';
import 'package:app_voyce/horizontal_list/categories.dart';
import 'package:app_voyce/horizontal_list/countries.dart';

class Home extends StatefulWidget {
  final int iduser;
  Home({Key key, this.iduser}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xfff09819),
                  Color(0xffedde5d),
                ]),
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        title: Container(
          width: 250.0,
          height: 43.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            // borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Voyce",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,),iconSize: 27.0, onPressed: (){}),
          new IconButton(icon: Icon(Icons.person, color: Colors.white,),iconSize: 27.0,
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewProfile()),
              );
              },
          ),
        ],
      ),
      
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text('Anis Syahirah'), accountEmail: Text('anis@pinkexc.com'))
          ],

        ),
      ),
      body: new ListView(
        children: <Widget>[
          Container(height:10.0),
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Categories', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Georgia'),textAlign: TextAlign.center,),),
          CategoryFirst(),
          Container(height: 10.0,),
          CategorySecond(),
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Countries', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Georgia'),textAlign: TextAlign.center,),),
          Container(height: 10.0,),
          CountryOne(),
          CountryTwo(),
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Recommended', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Georgia'),textAlign: TextAlign.center,),),
          Container(
            height: 500.0,

            child: Recommended(),
          )
        ],
      ) ,
    );
  }
}
