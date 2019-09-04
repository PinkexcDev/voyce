import 'package:flutter/material.dart';
import 'package:app_voyce/start_page/firstpage.dart';

class CategoryFirst extends StatefulWidget {
  @override
  _CategoryFirstState createState() => _CategoryFirstState();
}

class _CategoryFirstState extends State<CategoryFirst> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 100.0,

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
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/groceries.jpg",
                    width: 90.0,
                    height: 70.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Groceries", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/tuxedo.png",
                    width: 60.0,
                    height: 70.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Men's Fashion", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/dress.png",
                    width: 90.0,
                    height: 65.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Women's Fashion", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/smartwatch.png",
                    width: 90.0,
                    height: 70.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Accessories", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySecond extends StatefulWidget {
  @override
  _CategorySecondState createState() => _CategorySecondState();
}

class _CategorySecondState extends State<CategorySecond> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 100.0,
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
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/health.png",
                    width: 80.0,
                    height: 70.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Health & Beauty", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/phone.png",
                    width: 80.0,
                    height: 65.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Lifestyle & Gadget", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/basketball.png",
                    width: 90.0,
                    height: 70.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Hobbies", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom:2.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90.0,
                child: ListTile(
                  title: Image.asset(
                    "assets/images/categories/statue-of-liberty.png",
                    width: 100.0,
                    height: 70.0,),
                  subtitle: new Container(
                    alignment: Alignment.topCenter,
                    child: Text("Duty Free", style: new TextStyle(fontSize: 10.0),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

