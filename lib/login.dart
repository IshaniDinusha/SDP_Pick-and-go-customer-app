import 'package:flutter/material.dart';
import 'package:pickngo/Presenter/mainPresenter.dart';
import 'package:pickngo/Styles/textStyles.dart';
import 'package:pickngo/animation/FadeAnimation.dart';
import 'package:pickngo/dashboard.dart';
import 'package:pickngo/signup.dart';
import 'package:pickngo/trackingpage.dart';

class LoginPage extends StatelessWidget {
  @override

  final email= TextEditingController();
  final password=TextEditingController();
  Presenter presenter=Presenter();

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Login to your account",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          1.2,
                          makeInput(
                            label: "Email",
                            controller: email,
                          ),
                        ),
                        FadeAnimation(
                          1.3,
                          makeInput(
                            label: "Password",
                            obscureText: true,
                            controller: password,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: GestureDetector(
                        onTap: () {
                          presenter.login(email.text, password.text, context);
                        },
                        child: Container(
                          width: 280.0,
                          height: 50.0,
                          margin: EdgeInsets.only(top: 25.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0XFF0063eb),
                                Color(0XFF0088ff),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: buttonText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },

                          child: Text(
                            " Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FadeAnimation(
              1.2,
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false,controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
