import 'package:flutter/material.dart';
import 'package:voyce_app/start_page/sign_in.dart';
import 'package:voyce_app/start_page/sign_up.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //alignment: Alignment.topCenter,
      //padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),

      child: Stack(
        children: <Widget>[
          new Container(
        decoration: new BoxDecoration(
        image: new DecorationImage(
        image: new AssetImage('assets/images/Asset 59(1).png'),
        fit: BoxFit.none,
    ),
    ),
      ),
          new Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(child: Container(),),
              new Container(
                height: 250.0,
                child: Image.asset('assets/images/Voyce_transparent(1).png',
                width: 150.0,
                height: 100.0,),
              ),
              new SizedBox(
                width: 250.0,
                height: 40.0,
                child: new RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  splashColor: Colors.deepOrangeAccent,
                  color: Color(0xfff09819),
                  child: new Text(
                    "Sign In",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => SignIn()));
                  },
                ),
              ),
              new Container(height: 15.0,),
              new SizedBox(
                width: 250.0,
                height: 40.0,
                child: new RaisedButton(
                  shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xfff09819)),
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                  splashColor: Colors.deepOrangeAccent,
                  color: Colors.transparent,
                  child: new Text(
                    "Sign Up",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ),
                new Container(height: 200.0,),



            ],
      ),
      ]
    ),
    );
  }
}