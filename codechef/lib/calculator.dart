import 'package:codechef/backup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';






class Calculator extends StatefulWidget {
  Calculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "AC"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X" || buttonText == '^' || buttonText == "%" || buttonText == "LOG"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

        num2 = double.parse(output);

        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "X") {
          _output = (num1 * num2).toString();
        }
        if (operand == "/") {
          _output = (num1 / num2).toString();
        }

        if (operand == "^") {
          _output = pow(num1, num2).toString();
        }

        if (operand == "%") {
          _output = (num1 / 100).toString();
        }

        if (operand == "LOG") {
          _output = log(num1).toString();
        }


        num1 = 0.0;
        num2 = 0.0;
        operand = "";


    }

    else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

    });

  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold, color: Colors.white
          ),
        ),
        onPressed: () {
            buttonPressed(buttonText);
        },
      ),
    );
  }



  @override
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

                    child: Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                                alignment: Alignment.centerRight,
                                padding: new EdgeInsets.symmetric(
                                    vertical: 24.0,
                                    horizontal: 12.0
                                ),
                                child: new Text(output, style: new TextStyle(
                                    fontSize: 48.0,
                                    fontWeight: FontWeight.bold, color: Colors.white

                                ))),
                            new Expanded(
                              child: new Divider(),
                            ),


                            new Column(children: [
                              new Row(children: [
                                buildButton("LOG"),
                                buildButton("%"),
                                buildButton("^"),
                                buildButton("/")
                              ],),

                              new Row(children: [
                                buildButton("7"),
                                buildButton("8"),
                                buildButton("9"),
                                buildButton("X")
                              ]),

                              new Row(children: [
                                buildButton("4"),
                                buildButton("5"),
                                buildButton("6"),
                                buildButton("-")
                              ]),

                              new Row(children: [
                                buildButton("1"),
                                buildButton("2"),
                                buildButton("3"),
                                buildButton("+")
                              ]),

                              new Row(children: [
                                buildButton("AC"),
                                buildButton("0"),
                                buildButton("."),
                                buildButton("="),
                              ])
                            ])
                          ],
                        )
                    )
                )
            )
        )
    );



  }
}