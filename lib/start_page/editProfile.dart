import 'dart:convert';
import 'package:app_voyce/api/api.dart';
import 'package:flutter/material.dart';
import 'package:app_voyce/start_page/firstpage.dart';
import 'package:app_voyce/homepage/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController mailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void _validateInputs() async {
  var data = {
    "username": userNameController.text,
    "email": mailController.text,
    "password": passwordController.text,
    "phone": phoneController.text,
  };
  var res = await CallApi().postData(data, 'updateProfile');
  var body = json.decode(res.body);

}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController editUsernameController = new TextEditingController();
  TextEditingController editEmailController = new TextEditingController();
  TextEditingController editPasswordController = new TextEditingController();
  TextEditingController editPhoneController = new TextEditingController();


  FocusNode _focusNodeUsername = new FocusNode();
  FocusNode _focusNodeEmail = new FocusNode();
  FocusNode _focusNodePhoneNumber = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();


  void _editProfile() async{
    var data = {
      "username": editUsernameController.text,
      "email": editEmailController.text,
      "password": editPasswordController.text,
      "mobile_number": editPhoneController.text
    };
    var res = await CallApi().postData(data, 'updateProfile');
    var body = json.decode(res.body);
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /////////////  background/////////////
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image:AssetImage('assets/images/Asset 58(1).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            /////////////// name////////////
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: userNameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color: Color(0xFFF8B500),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// Email ////////////
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                                hintText: "Email ",
                                hintStyle: TextStyle(
                                    color: Color(0xFFF8B500),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: phoneController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: Colors.black,
                                ),
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                    color: Color(0xFFF8B500),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// Password ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.black,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFFF8B500),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// SignUp Button ////////////

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                onPressed: _validateInputs,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 10),
                                  child: Text(
                                    'Save',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color: Color(0xFFFF9068),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(20.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /////////////// already have an account ////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Home()));
                        },
                        child: Text(
                          'Home',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),

    );
  }
}