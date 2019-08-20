import 'package:flutter/material.dart';
import 'package:voyce_app/homepage/recommended_details.dart';


class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  var productList = [
    {
      "name": "Women Bag",
      "picture": "img/products/womenbag.png",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Blazzer1",
      "picture": "img/products/blazer1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Blazzer2",
      "picture": "img/products/blazer2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Red Dress",
      "picture": "img/products/dress1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Dress",
      "picture": "img/products/dress2.jpeg",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Hills",
      "picture": "img/products/hills1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Hills",
      "picture": "img/products/hills2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Panet",
      "picture": "img/products/pants2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "SKT",
      "picture": "img/products/skt1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "SKT",
      "picture": "img/products/skt1.jpeg",
      "old price": 120,
      "price": 85
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return Single_Product(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['old price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class Single_Product extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  Single_Product(
      {this.productName,
        this.productPicture,
        this.productOldPrice,
        this.productPrice});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildProduct(context),
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => RecommendedDetails(
                //navigate to detailed page with passing data
                productDetailsName: productName,
                productDetailsPicture: productPicture,
                productDetailsOldPrice: productOldPrice,
                productDetailsNewPrice: productPrice,
              ))),
    );
  }

  Widget buildProduct(BuildContext context) {
    return Card(
      //elevation: 10,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: new BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.25,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    productPicture,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ],
              ),
              flex: 5,
            ),
            Expanded(
              child: Stack(
                children:<Widget>[ListTile(
                  title: Text(
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\RM $productPrice",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, color: Colors.red)),
                      ),

//                    Expanded(
//                      child: Text(
//                        "\$$productOldPrice",
//                        overflow: TextOverflow.ellipsis,
//                        maxLines: 1,
//                        style: TextStyle(
//                            color: Colors.grey,
//                            fontWeight: FontWeight.w400,
//                            decoration: TextDecoration.lineThrough),
//                      ),
//                    ),
                    ],
                  ),
                ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
                child: ListTile(
                  title: Text('hahahah'),
                )),
          ],
        ),
      ),
    );
  }
}