import 'package:flutter/material.dart';
import 'package:voyce_app/start_page/firstpage.dart';

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
                    "assets/images/categories/groceries.png",
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
                    "assets/images/categories/polo-shirt.png",
                    width: 90.0,
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
                    "assets/images/categories/clothing.png",
                    width: 90.0,
                    height: 70.0,),
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
                    "assets/images/categories/earrings.png",
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
                    "assets/images/categories/toothbrush.png",
                    width: 90.0,
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
                    "assets/images/categories/smartphone.png",
                    width: 90.0,
                    height: 70.0,),
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
                    width: 90.0,
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

