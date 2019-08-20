import 'package:flutter/material.dart';
import 'package:voyce_app/start_page/firstpage.dart';
//import 'package:voyce_app/start_page/firstpage.dart';

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
                  "assets/images/country/uk.png",
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
                  "assets/images/country/fr.png",
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
                  "assets/images/country/japan.png",
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
                    "assets/images/country/us.png",
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
                    "assets/images/country/china.png",
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
                    "assets/images/country/germany.png",
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


