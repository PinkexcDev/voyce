import 'dart:convert';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:app_voyce/api/api.dart';
import 'package:app_voyce/start_page/sign_in.dart';
import 'package:app_voyce/style/ensure_visible.dart';

class VerifyNumber extends StatefulWidget {
  final int iduser;
  VerifyNumber({Key key, this.iduser}) : super(key: key);
  @override
  _VerifyNumberState createState() => new _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CountryCode _selected;
  FocusNode _focusNodeVerifyNumber = FocusNode();
  FocusNode _focusNodeOTPRequest = FocusNode();

  TextEditingController VerifyNumberController = new TextEditingController();
  TextEditingController EnterOTPController = new TextEditingController();

//  FocusNode _focusNodeMobileNum = new FocusNode();
//  FocusNode _focusNodeEnterOTP = new FocusNode();


  String _username;


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

  void _requestOTP(country) async{
    print(country.toString());
    var iduser = widget.iduser;
    print(widget.iduser);

    var data = {
      // "id": iduser,
      "id": iduser,
      "mobile_number" :VerifyNumberController.text,
      "countryCode" : country.toString(),
    };

    var res = await CallApi().postData(data, 'sendmobile');
    var body = json.decode(res.body);

    if(body['success']){
      print(body['Message']);
      showInSnackBar(body['Message']);
    }

    else {
      print(body['Message']);
      showInSnackBar(body['Message']);
    }

  }

  void _signUp() async{
    var iduser = widget.iduser;
    var data = {
      "id": iduser,
      "sms_code":EnterOTPController.text,
    };
    var res = await CallApi().postData(data, 'confirmmobile');
    var body = json.decode(res.body);

    if(body['success']){
      showInSnackBar(body['Message']);
    }
    else{
      showInSnackBar(body['Message']);
    }
  }


//  static final TextEditingController _firstNameController = new TextEditingController();
//  static final TextEditingController _lastNameController = new TextEditingController();
//  static final TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: AssetImage('assets/images/Asset 58(1).png'),
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
                      child: Text('Verify your Mobile Number',
                        //textAlign: TextAlign,
                        style: TextStyle(fontSize:40.0, color: Colors.white, fontFamily: 'Georgia'),

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
                                child: new SingleChildScrollView(
                                  // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[


                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeVerifyNumber,
                                        child: new TextFormField(
                                            controller: VerifyNumberController,
                                            style:new TextStyle(color:Colors.white.withOpacity(0.5),
                                                fontSize: 14.0),
                                            keyboardType:TextInputType.number,
                                            decoration: new InputDecoration(
                                              hintText: 'Mobile Number (eg: 123456789)',
                                              prefixIcon: CountryCodePicker(
                                                onChanged: (CountryCode country){
                                                  setState(() {
                                                    _selected = country;
                                                  });
                                                },
                                                padding: const EdgeInsets.only(bottom: 5.5),
                                                textStyle: TextStyle(color: Colors.yellow, fontSize: 14.0),
                                                initialSelection: 'MY',
                                                favorite: ['+60', 'MY'],
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed: false,
                                                alignLeft: false,
                                              ),
                                            )),
                                      ),
                                      new EnsureVisibleWhenFocused(
                                        focusNode: _focusNodeOTPRequest,
                                        child: new TextFormField(
                                          controller: EnterOTPController,
                                          style: new TextStyle(color:Colors.white.withOpacity(0.5),
                                              fontSize: 14.0),
                                          keyboardType: TextInputType.number,
                                          decoration: new InputDecoration(
                                              hintText: 'Enter OTP',
                                              suffixIcon: new InkWell(
                                                onTap: () {
                                                  _requestOTP(_selected);
                                                },

                                                child: new Container(
                                                  width: 130.0,
                                                  height: 30.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.transparent,
                                                    // border: new Border.all(color: Colors.white, width: 2.0),
                                                    borderRadius: new BorderRadius.circular(10.0),
                                                  ),
                                                  child: new Center(
                                                    child: new Text('Request OTP',
                                                      style: new TextStyle(
                                                        fontSize: 14.0,
                                                        color: Color(0xffedde5d),),),),
                                                ),
                                              )

                                          ),),
                                      ),
                                      const SizedBox(height: 15.0),
                                      const SizedBox(height: 15.0),
                                      const SizedBox(height: 15.0),
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
                  Container(height: 40.0,),
                  new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      onTap: _signUp,
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
                          child: new Text('Sign Up',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                  new Container(height: 40.0,),
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
                  new Container(height: 30.0,),
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
    _focusNodeOTPRequest;
    _focusNodeVerifyNumber;
    super.dispose();
  }

}