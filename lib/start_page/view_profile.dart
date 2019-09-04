import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_voyce/start_page/firstpage.dart';
import 'package:app_voyce/start_page/editProfile.dart';
import 'package:app_voyce/api/api.dart';

class ViewProfile extends StatefulWidget {
  @override
  final List list;
  final int index;

  ViewProfile({this.list, this.index});

  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: AssetImage('assets/images/Asset 58(1).png'),
          fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(

        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.transparent,

        body: Stack(
          children:<Widget> [


            Container( padding: EdgeInsets.only(top: 90.0, left: 10.0),
              child: new Material(
                type: MaterialType.transparency,
                child: Text('User Details',
                  //textAlign: TextAlign,
                  style: TextStyle(fontSize:35.0, color: Colors.white, fontFamily: 'Georgia', fontWeight: FontWeight.bold),

                ),
              ),),
            Container(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ////////////// 1st card///////////
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 40, bottom: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ////////////  first name ////////////

                              Card(
                                elevation: 4.0,
                                color: Colors.white,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.account_circle,
                                              color: Colors.orangeAccent,
                                            ),
                                          ),
                                          Text(
                                            'Username',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 17.0,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Georgia'
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35),
                                        child: Text(
                                          userData!= null ? '${userData['username']}' : '',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color(0xFF9b9b9b),
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                              ////////////  Email /////////
                              Card(
                                elevation: 4.0,
                                color: Colors.white,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.mail,
                                              color: Colors.orangeAccent,
                                            ),
                                          ),
                                          Text(
                                            'Email',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 17.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Georgia'
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35),
                                        child: Text(
                                          userData!= null ? '${userData['email']}' : '',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color(0xFF9b9b9b),
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ////////////////////// phone ///////////
                              Card(
                                elevation: 4.0,
                                color: Colors.white,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.orangeAccent,
                                            ),
                                          ),
                                          Text(
                                            'Mobile Number',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 17.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Georgia'
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35),
                                        child: Text(
                                          userData!= null ? '${userData['country_code']}${userData['phone_number']}' : '',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color(0xFF9b9b9b),
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ////////////end  part////////////
                            ],
                          ),
                        ),


                      /////////////// Button////////////
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            /////////// Edit Button /////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),

                                  child: Text(
                                    'Edit Profile',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color:  Colors.orangeAccent,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => EditProfile()));
                                },
                              ),
                            ),

                            ////////////// logout//////////

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      'Logout',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color:  Colors.orangeAccent,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(20.0)),
                                  onPressed: logout
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
  void logout() async{
    // logout from the server ...
    var res = await CallApi().getData('logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => FirstPage()));
    }

  }


}