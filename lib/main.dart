import 'package:flutter/material.dart';
import 'package:unistudent/screen/login_screen.dart';
import 'package:unistudent/screen/noroute_screen.dart';
import 'package:unistudent/screen/home_screen.dart';
import 'package:flutter/services.dart';

import 'models/InitialDataModel.dart';
//import 'package:flutter/foundation.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: Colors.black,
  accentColor: Colors.black,
  brightness: Brightness.light,
);

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF8BBD0), //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    )
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      initialRoute: '/',
      onGenerateRoute: (settings) {

        //We should check if there is a token already.
        

        switch(settings.name){
          case '/':
            return MaterialPageRoute(builder: (_) => LoginScreen());
          case '/HomePage':
            InitialDataModel model = settings.arguments;
            return MaterialPageRoute(builder: (_) => HomeScreen(model: model,));
          default:
            return MaterialPageRoute(builder: (_) => NoRoute());
        }
      },
    ),
  );
}