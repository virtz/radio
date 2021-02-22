import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radio/pages/home.dart';
import 'package:radio/pages/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = false;
  bool autoValidate = false;

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(80)),
                  Center(
                    child: Container(
                        // height: ScreenUtil().setHeight(90),
                        // width: ScreenUtil().setWidth(100),
                        child: SvgPicture.asset('assets/images/launcher.svg',
                            width: 100, height: 90)),
                  ),
                  Text('Mapoly Radio',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Text('Where good music lives',
                      style: TextStyle(fontSize: 11.0, color: Colors.grey)),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  Form(
                    autovalidate: autoValidate,
                    key: formKey,
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          // controller: _controller,
                          style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                          autocorrect: true,
                          onSaved: (val) => username = val,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          // enabled: !userProvider.isLoading(),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFFF),
                            //  errorText: userProvider.getMessage(),
                            filled: true,
                            // errorText: email == null?'value cannot be empty':email,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            // border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Color(0xFFD8D8DF), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Color(0xFFD8D8DF), width: 1),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    color: Color(0xFFD8D8DF), width: 1)),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child: SvgPicture.asset(
                                      'assets/images/user.svg')),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 20.0),

                            // prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        TextFormField(
                          // controller: _controller,
                          style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                          autocorrect: true,
                          onSaved: (val) => password = val,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          // enabled: !userProvider.isLoading(),
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFFF),
                            //  errorText: userProvider.getMessage(),

                            filled: true,
                            // errorText: email == null?'value cannot be empty':email,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            // border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Color(0xFFD8D8DF), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Color(0xFFD8D8DF), width: 1),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    color: Color(0xFFD8D8DF), width: 1)),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child: SvgPicture.asset(
                                      'assets/images/lock.svg')),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 20.0),

                            suffix: GestureDetector(
                                onTap: _toggle,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    isObscure ? "Show" : "Hide",
                                  ),
                                )),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 20.0),

                            // prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: MaterialButton(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              height: ScreenUtil().setHeight(50),
                              onPressed: () => _submit(),
                              color: Colors.black,
                              child: Center(
                                  child:
                                      // userProvider.isLoading()
                                      // _isButtonDisabled == true
                                      // ? CircularProgressIndicator(
                                      //     backgroundColor: Colors.white,
                                      //     strokeWidth: 2)
                                      // :
                                      Text('Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ScreenUtil().setSp(14))))),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Signup()));
                          },
                          child: Text('Do not have an account?',
                              style: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(230)),
                        Text('By signing up you have agreed to our',
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        Text('Terms of Use & Privacy Policy',
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        SizedBox(height: ScreenUtil().setHeight(20))
                      ],
                    )),
                  )
                ],
              ),
            )),
      ),
    );
  }

  void _toggle() {
    setState(() {
      isObscure = !isObscure;
    });
  }
  _submit() {
  final form = formKey.currentState;
    if(form.validate()){
      form.save();
      Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
    }else{
      setState(() {
        autoValidate = true;
      });
    }
}

}

