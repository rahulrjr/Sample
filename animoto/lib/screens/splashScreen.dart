import 'package:animoto/screens/appLogin.dart';
import 'package:animoto/screens/homePage.dart';
import 'package:animoto/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: LoginPage(),
        loaderColor: Colors.blueAccent,
        loadingText: Text("loading......"),
        title: Text("Animoto",style: TextStyle(fontSize:25,fontWeight:FontWeight.bold),),
      ),
    );
  }
}