import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:voyce/api/api.dart';
import 'package:voyce/start_page/sign_in.dart';
import 'package:voyce/start_page/sign_up.dart';
import 'package:voyce/style/ensure_visible.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController forgotPasswordController = new TextEditingController();
  FocusNode _focusNodeForgotPassword = new FocusNode();

  void _resetPassword() async{
    var data = {
      "email": forgotPasswordController.text,
    };
    var res = await CallApi().postData(data, 'reset');
    var body = json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: AssetImage('assets/images/Asset 58(1).png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                  Container(
                    height: 80.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: new Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Reset Password',
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.blueGrey,
                              accentColor: Colors.orange,
                              hintColor: Colors.white70,
                            ),
                            child: SingleChildScrollView(
                              child: new Form(
                                key: _formKey,
                                child: new SingleChildScrollView(
                                  // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeForgotPassword,
                                        child: new TextFormField(
                                            controller:
                                            forgotPasswordController,
                                            validator: (value) {
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex =
                                              new RegExp(pattern);
                                              if (!regex.hasMatch(value)) {
                                                return ('Enter Valid Email');
                                              } else {
                                                return null;
                                              }
                                            },
                                            style: new TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontSize: 14.0),
                                            keyboardType:
                                            TextInputType.emailAddress,
                                            decoration: new InputDecoration(
                                              hintText: 'Enter e-mail',
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70.0,
                  ),
                  new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      onTap: _resetPassword,
                      /*() => Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => VerifyNumber()))*/
                      child: new Container(
                        width: 200.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[
                            Color(0xfff09819),
                            Color(0xffedde5d),
                          ]),

                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: new Center(
                          child: new Text(
                            'Reset Password',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                  ),
                  new InkWell(
                    child: Text('<< BACK',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withOpacity(0.5),
                      ),),
                    onTap: ()=>Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => SignIn())),
                  ),

                  Container(
                    height: 40.0,
                  ),
                  new Text('Don\'t have account?',textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                    ),),
                  Container(
                    height: 10.0,
                  ),
                  new InkWell(
                    child: Text('Sign Up',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withOpacity(0.5),
                          decoration: TextDecoration.underline),),
                    onTap: ()=>Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => SignUp())),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
