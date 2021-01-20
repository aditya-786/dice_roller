import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage defaultImage1;
  AssetImage defaultImage2;
  var text1, text2, sign;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      defaultImage1 = one;
      defaultImage2 = one;
      text1 = "1";
      text2 = "1";
      sign = "=";
    });
  }

  void changeDice1() {
    setState(() {
      int randNum1 = Random().nextInt(6) + 1;
      text1 = randNum1.toString();

      switch (randNum1) {
        case 1:
          defaultImage1 = one;
          break;
        case 2:
          defaultImage1 = two;
          break;
        case 3:
          defaultImage1 = three;
          break;

        case 4:
          defaultImage1 = four;
          break;

        case 5:
          defaultImage1 = five;
          break;

        case 6:
          defaultImage1 = six;
          break;
      }

      int randNum2 = Random().nextInt(6) + 1;
      text2 = randNum2.toString();

      switch (randNum2) {
        case 1:
          defaultImage2 = one;
          break;
        case 2:
          defaultImage2 = two;
          break;
        case 3:
          defaultImage2 = three;
          break;

        case 4:
          defaultImage2 = four;
          break;

        case 5:
          defaultImage2 = five;
          break;

        case 6:
          defaultImage2 = six;
          break;
      }

      if (randNum1 == randNum2)
        sign = "=";
      else if (randNum1 > randNum2)
        sign = ">";
      else if (randNum1 < randNum2) sign = "<";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image(
                      image: defaultImage1,
                      width: 150.0,
                      height: 150.0,
                    ),
                    margin: EdgeInsets.only(right: 50.0),
                  ),
                  Image(
                    image: defaultImage2,
                    width: 150.0,
                    height: 150.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      text1,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(80, 40, 80, 0),
                    child: Text(
                      sign,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      text2,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Roll Dice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  onPressed: changeDice1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
