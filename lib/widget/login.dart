import 'package:flutter/material.dart';
import 'package:unistudent/util/color.dart';

class Login extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const Login({
    Key key,
    this.emailController,
    this.passwordController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 185),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              fontFamily: 'Bold',
              fontSize: 24,
              color: colorText,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Medium',
              color: colorInputText,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              labelText: 'Correo',
              labelStyle: TextStyle(
                fontFamily: 'Medium',
                color: colorText,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Medium',
              color: colorInputText,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              labelText: 'Contraseña',
              labelStyle: TextStyle(
                fontFamily: 'Medium',
                color: colorText,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            child: Text(
              'Olvido la contraseña ?',
              style: TextStyle(
                fontFamily: 'Medium',
                fontSize: 12,
                color: colorBlueText,
              ),
            ),
            alignment: Alignment.centerRight,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}