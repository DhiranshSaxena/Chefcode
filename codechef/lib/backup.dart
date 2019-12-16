import 'package:flutter/material.dart';
import 'package:codechef/calculator.dart';
import 'package:flutter/services.dart';


class Backup extends StatefulWidget {

  String value;
  Backup({Key key, this.value}) : super(key:key);


  @override
  _backupScreenState createState() => _backupScreenState(value);



}

class _backupScreenState extends State<Backup> {

  String value;
  _backupScreenState(this.value);

  showExitPop(){
    return showDialog(
      context: context,
        builder: (context){
         return AlertDialog(shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10),
         ),
           backgroundColor: Color(0xFF4563DB),
           title: Text("Confirm", style: TextStyle(color: Colors.white),),
          content: Text("Do You Want To Exit The App", style: TextStyle(color: Colors.white),),

          actions: <Widget>[
            RaisedButton(
              color: Color(0xFF5036D5),
          child: Text("NO", style: TextStyle(color: Colors.white),),
          onPressed: (){
            Navigator.of(context).pop();
          },
          ),

          RaisedButton(
            color: Color(0xFF3594DD),
          child: Text("YES", style: TextStyle(color: Colors.white),),
          onPressed: (){
            SystemNavigator.pop();

          },
          )

          ],
         );
    },);
  }


  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Calculator()),);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'CALCULATOR',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: (){
             showExitPop();
      } ,



    child: Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3594DD),
                      Color(0xFF4563DB),
                      Color(0xFF5036D5),
                      Color(0xFF5B16D0),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircleAvatar(
                        backgroundImage: AssetImage('assets/icon.jpg'),
                        radius: 60.0,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0),
                      ),

                      Text(
                        'WELCOME!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        value.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                      ),
                      _buildLoginBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
      );
  }
}
