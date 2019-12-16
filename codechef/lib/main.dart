import 'dart:async';

import 'package:codechef/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() => runApp(new MaterialApp(

  theme:
  ThemeData(primaryColor: Colors.blue, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),));


class SplashScreen extends StatefulWidget
{
  _SplashScreenState createState() => new  _SplashScreenState();
}

class  _SplashScreenState extends State<SplashScreen> {


  void completed()
  {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingScreen() ),);
  }


  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  Widget build(BuildContext context) {


    return new Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ],
              ),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(

                      flex: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.jpg'),
                              radius: 60.0,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0),
                            ),
                            Text("CSI", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Padding(padding: EdgeInsets.only(top: 20.0),),
                          Text("<EVERYTHING ABOUT CODING>", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),)
                        ],
                      ),
                    )
                  ],
                )
            )

        ),
      ),
    );
  }
}
