import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voyce/start_page/sign_in.dart';
import 'package:voyce/style/ensure_visible.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FocusNode _focusNodeUsername = new FocusNode();
  FocusNode _focusNodeEmail = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();
  FocusNode _focusNodeConfirmPassword = new FocusNode();

  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

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
                Container( padding: EdgeInsets.only(top: 15.0),
                  child: new Material(
                    type: MaterialType.transparency,
                    child: Text('Get on Board',
                      //textAlign: TextAlign,
                      style: TextStyle(fontSize:40.0, color: Colors.white),

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
                                  child: new SingleChildScrollView(
                                   // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        new EnsureVisibleWhenFocused(
                                      focusNode: _focusNodeUsername,
                                          child: new TextFormField( style:new TextStyle(color: Colors.white.withOpacity(0.5),
                                              fontSize: 14.0),
                                              decoration: new InputDecoration(
                                                hintText: 'Username',
                                              )),
                                        ),

                                        Container(height: 15.0),
                                        new EnsureVisibleWhenFocused(
                                          focusNode: _focusNodeEmail,
                                          child: new TextFormField( style:new TextStyle(color: Colors.white.withOpacity(0.5),
                                              fontSize: 14.0),
                                              decoration: new InputDecoration(
                                                hintText: 'E-mail',
                                              )),
                                        ),
                                        Container(height: 15.0),
                                        new EnsureVisibleWhenFocused(
                                          focusNode: _focusNodePassword,
                                          child: new TextFormField(
                                              focusNode: _focusNodePassword,
                                              obscureText: _obscureTextSignup,
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
                                        Container(height: 15.0,),
                                        new Text('By creating an account, you agree to the Term of Use and Privacy Policy',
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
                    onTap: () => Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => TestPage())),
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