import 'package:flutter/material.dart';
import 'package:unistudent/models/InitialDataModel.dart';
import 'package:unistudent/util/color.dart';
import 'package:unistudent/widget/login.dart';
import 'package:unistudent/services/UserStore.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login method
  Future doLogin() async {
    if(emailController.text != null && passwordController.text != null){
      var url = 'http://192.168.1.19:3000/user/login';
      final response = await Http.post(url, body: {'email': emailController.text, 'password': passwordController.text});
      if(response.statusCode == 200){
        //Store safe store data
        await UserStore().setUserEmail(emailController.text);
        await UserStore().setUserPassword(passwordController.text);

        InitialDataModel initialDataModel = InitialDataModel.fromJson(json.decode(response.body));
        initialDataModel.email = emailController.text;

        //Navigate to home
        Navigator.of(context).popAndPushNamed('/HomePage', arguments: initialDataModel); 
      } else {
        throw Exception("Failed to load");
      }
    } else {
      throw Exception("Fill Out the whole form!");
    }
  }

  @override void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFCE4EC),
      body: Container(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Container(                
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(left: 60.0),
                    child: Image.asset('assets/image/logo_uni_1.png'),
                  ),
                  Login(emailController: emailController, passwordController: passwordController,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  width: 130,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorButton1,
                        colorButton2,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorButton1.withOpacity(0.3),
                        blurRadius: 4,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: FlatButton(
                      onPressed: doLogin,
                      child: Text(
                        'INGRESAR',
                          style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bold',
                          fontSize: 14,
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}