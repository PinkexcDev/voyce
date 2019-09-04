import 'package:flutter/material.dart';
import 'package:voyce/start_page/firstpage.dart';
//import 'package:voyce/start_page/firstpage.dart';

class CountryOne extends StatefulWidget {
  @override
  _CountryOneState createState() => _CountryOneState();
}

class _CountryOneState extends State<CountryOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/my.png",
                    width: 30.0,
                    height: 40.0,),

                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/brazil.png",
                    width: 30.0,
                    height: 40.0,),

                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/spain.png",
                    width: 30.0,
                    height: 40.0,),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/Thailand.png",
                    width: 30.0,
                    height: 40.0,),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/jp.png",
                    width: 30.0,
                    height: 40.0,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryTwo extends StatefulWidget {
  @override
  _CountryTwoState createState() => _CountryTwoState();
}

class _CountryTwoState extends State<CountryTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/unitedStates.jpg",
                    width: 30.0,
                    height: 40.0,),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/sg.png",
                    width: 30.0,
                    height: 40.0,),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/korea.png",
                    width: 50.0,
                    height: 50.0,),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/indonesia.jpg",
                    width: 30.0,
                    height: 40.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 70.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/country/czech-republic.png",
                    width: 30.0,
                    height: 40.0,),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


