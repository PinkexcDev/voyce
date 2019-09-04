import 'package:flutter/material.dart';
import 'package:app_voyce/start_page/sign_in.dart';
import 'package:app_voyce/start_page/sign_up.dart';

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
                Container(
                  height: 46,
                  width: 300,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    gradient: LinearGradient(
                        colors: [
                          Colors.orangeAccent,
                          Colors.yellowAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: FlatButton(
                    child: Text("Sign In", style: TextStyle(fontFamily: 'Georgia', fontSize: 18)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                  ),
                ),

              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  height: 46,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orangeAccent,
                      width: 2.0,
                    ),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),


                  child: FlatButton(
                    child: Text("Sign Up", style: TextStyle(fontFamily: 'Georgia', fontSize: 18, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
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