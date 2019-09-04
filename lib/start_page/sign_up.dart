import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_voyce/api/api.dart';
import 'package:app_voyce/start_page/sign_in.dart';
import 'package:app_voyce/start_page/verify_number.dart';
import 'package:app_voyce/style/ensure_visible.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController signupUsernameController = new TextEditingController();
  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController = new TextEditingController();

  FocusNode _focusNodeUsername = new FocusNode();
  FocusNode _focusNodeEmail = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();
  FocusNode _focusNodeConfirmPassword = new FocusNode();

  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;
  bool _autoValidate = false;

  String _username;

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm(){
    setState((){
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      var data = {
        "username" :signupUsernameController.text,
        "email": signupEmailController.text,
        "password" : signupPasswordController.text,
      };
      var res = await CallApi().postData(data, 'signup');
      var body = json.decode(res.body);
      int id = body['user']['id'];
      print(body['user']['id']);
      if(body['success']){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));

        Navigator.push(
            context,
            new MaterialPageRoute(builder: (context)=>VerifyNumber(iduser: id))
        );
      }

      else{
        showInSnackBar('ddd');
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
                  Container( padding: EdgeInsets.only(top: 1.0, right: 140.0),
                    child: new Material(
                      type: MaterialType.transparency,
                      child: Text('Get on Board',
                        //textAlign: TextAlign,
                        style: TextStyle(fontSize:35.0, color: Colors.white, fontFamily: 'Georgia', fontWeight: FontWeight.bold),

                      ),
                    ),),
                  Container(height: 30.0,),
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
                                        focusNode: _focusNodeUsername,
                                        child: new TextFormField(
                                            controller: signupUsernameController,
                                            onSaved: (String val){
                                              _username = val;
                                            },
                                            style:new TextStyle(
                                                color: Colors.white.withOpacity(0.5),
                                                fontSize: 14.0),
                                            decoration: new InputDecoration(
                                              hintText: 'Username',
                                            )),
                                      ),

                                      Container(height: 15.0),
                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeEmail,
                                        child: new TextFormField(
                                            controller: signupEmailController,
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
                                        focusNode: _focusNodePassword,
                                        child: new TextFormField(
                                            controller: signupPasswordController,
                                            focusNode: _focusNodePassword,
                                            obscureText: _obscureTextSignup,
                                            validator: (value){
                                              if(value.isEmpty) {
                                                return 'Please enter password';
                                              }
                                              if(value.length < 8)
                                                return 'Password must be 8 characters and more';
                                            },
                                            style:new TextStyle(
                                                color: Colors.white.withOpacity(0.5),
                                                fontSize: 14.0),
                                            decoration: new InputDecoration(
                                                hintText: 'Password',
                                                suffixIcon: GestureDetector(
                                                  onTap: _toggleSignup,
                                                  child: Icon(
                                                    _obscureTextSignup
                                                        ? FontAwesomeIcons.eye
                                                        : FontAwesomeIcons.eyeSlash,
                                                    size: 15.0,
                                                    color: Colors.white,
                                                  ),
                                                )
                                            )),
                                      ),
                                      const SizedBox(height: 15.0),
                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeConfirmPassword,
                                        child: new TextFormField(
                                            focusNode: _focusNodeConfirmPassword,
                                            obscureText: _obscureTextSignupConfirm,
                                            validator: (value){
                                              if(value != signupPasswordController.text){
                                                return 'Password not match';
                                              }
                                            },
                                            style:new TextStyle(
                                                color: Colors.white.withOpacity(0.5),
                                                fontSize: 14.0),
                                            decoration: new InputDecoration(
                                                hintText: 'Confirm Password',
                                                suffixIcon: GestureDetector(
                                                  onTap: _toggleSignupConfirm,
                                                  child: Icon(
                                                    _obscureTextSignupConfirm
                                                        ? FontAwesomeIcons.eye
                                                        : FontAwesomeIcons.eyeSlash,
                                                    size: 15.0,
                                                    color: Colors.white,
                                                  ),
                                                )
                                            )),
                                      ),
                                      Container(height: 20.0,),
                                      new Text('By creating an account, you agree to the \n Term of Use and Privacy Policy',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12.0),
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
                  Container(height: 30.0,),
                  new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      onTap: _validateInputs,
                      /*() => Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => VerifyNumber()))*/
                      child: new Container(
                        width: 180.0,
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
                          child: new Text('Continue',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                  Container(height: 40.0,),
                  new Material(
                    type: MaterialType.transparency,
                    child: new Container(
                      child: InkWell(
                        child: new Text('I am already a member',
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
    _focusNodeUsername.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();

    super.dispose();
  }

}