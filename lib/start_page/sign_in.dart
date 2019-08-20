import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyce_app/api/api.dart';
import 'package:voyce_app/homepage/index.dart';
import 'package:voyce_app/start_page/forgot_password.dart';
import 'package:voyce_app/start_page/verify_number.dart';
import 'package:voyce_app/style/ensure_visible.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => new _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();


  FocusNode _focusNodeLoginEmail = new FocusNode();
  FocusNode _focusNodeLoginPassword = new FocusNode();

  bool _obscureTextLogin = true;
  bool _autoValidate = false;

  String _username;

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }



  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();

      var data = {
        "email": loginEmailController.text,
        "password" : loginPasswordController.text,
      };
      var res = await CallApi().postData(data, 'signin');
      var body = json.decode(res.body);
     print(body['success']);
     int id = body['user']['id'];



      if(body['success']){
        if(body['status']) {
          SharedPreferences localStorage = await SharedPreferences
              .getInstance();
          localStorage.setString('token', body['token']);
          localStorage.setString('user', json.encode(body['user']));

          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => Home(iduser: id))
          );
        }
        else{
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => VerifyNumber(iduser : id))
             // new MaterialPageRoute(builder: (context) => SignUp())
          );
        }
      }

      else{
        showInSnackBar(body['message']);
      }


    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }




//  static final TextEditingController _firstNameController = new TextEditingController();
//  static final TextEditingController _lastNameController = new TextEditingController();
//  static final TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image:AssetImage('assets/images/Asset 58(1).png'),
          fit: BoxFit.cover,
        ),
      ),
      child:  Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children:<Widget> [
            SingleChildScrollView(
              child: new Column(
                children:<Widget>[
                  Row(children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                          color: Colors.white,),
                        onPressed:(){
                          Navigator.pop(context);
                        }
                    ),
                  ],),
                  Container(height: 80.0,),
                  Container( padding: EdgeInsets.only(top: 15.0, left: 15.0),
                    child: new Material(
                      type: MaterialType.transparency,
                      child: Text('Hello there, Welcome back',
                        //textAlign: TextAlign,
                        style: TextStyle(fontSize:40.0, color: Colors.white),

                      ),
                    ),),
                  Container(height: 50.0,),
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
                                autovalidate: _autoValidate,
                                child: new SingleChildScrollView(
                                  // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[


                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeLoginEmail,
                                        child: new TextFormField(
                                            controller: loginEmailController,
                                            validator: (value){
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex = new RegExp(pattern);
                                              if (!regex.hasMatch(value))
                                              { return ('Enter Valid Email');}
                                              else
                                              {return null;}
                                            },
                                            style:new TextStyle(
                                                color: Colors.white.withOpacity(0.5),
                                                fontSize: 14.0),
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: new InputDecoration(
                                              hintText: 'E-mail',
                                            )),
                                      ),
                                      Container(height: 15.0),
                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeLoginPassword,
                                        child: new TextFormField(
                                            controller: loginPasswordController,
                                            focusNode: _focusNodeLoginPassword,
                                            obscureText: _obscureTextLogin,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please enter password';
                                              }
                                            },
                                            style:new TextStyle(
                                                color: Colors.white.withOpacity(0.5),
                                                fontSize: 14.0),
                                            decoration: new InputDecoration(
                                                hintText: 'Password',
                                                suffixIcon: GestureDetector(
                                                  onTap: _toggleLogin,
                                                  child: Icon(
                                                    _obscureTextLogin
                                                        ? FontAwesomeIcons.eye
                                                        : FontAwesomeIcons.eyeSlash,
                                                    size: 15.0,
                                                    color: Colors.white,
                                                  ),
                                                )
                                            )),
                                      ),
                                      const SizedBox(height: 15.0),
                                      Container(height: 30.0,),
                                      new InkWell(
                                        child: Text('Forgot your Password?',textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white.withOpacity(0.5),
                                              decoration: TextDecoration.underline),),
                                        onTap: ()=>Navigator.push(
                                            context,
                                            new MaterialPageRoute(builder: (context) => ForgotPassword())),
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
                  Container(height: 40.0,),
                  new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      onTap: _validateInputs,
                      /*() => Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => VerifyNumber()))*/
                      child: new Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xfff09819),
                                Color(0xffedde5d),
                              ]),
                          // border: new Border.all(color: Colors.white, width: 2.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: new Center(
                          child: new Text('Sign In',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                  Container(height: 50.0,),
                  new Material(
                    type: MaterialType.transparency,
                    child: new Container(
                      child: InkWell(
                        child: new Text('New here? Sign Up instead',
                          style: TextStyle(color: Colors.white70,
                              decoration: TextDecoration.underline),),
                        onTap: ()=>Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => SignIn())),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );



  }
  @override
  void dispose() {

    _focusNodeLoginEmail.dispose();
    _focusNodeLoginPassword.dispose();


    super.dispose();
  }

}