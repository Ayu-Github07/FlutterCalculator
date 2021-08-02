import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Calculator Application",
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortoperform;
  String history = "";
  void btnClicked(String btnval) {
    if (btnval == "AC") {
      texttodisplay = "";
      res = "";
      history = "";
      firstnum = 0;
      secondnum = 0;
    } else if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "X" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      history = res + " " + btnval + " ";
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      history += secondnum.toString();
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      } else if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      } else if (operatortoperform == "X") {
        res = (firstnum * secondnum).toString();
      } else if (operatortoperform == "/") {
        if (secondnum == 0) {
          return;
        }
        res = (firstnum ~/ secondnum).toString();
      }
    } else if (btnval == "+/-") {
      if (texttodisplay[0] != '-') {
        res = '-' + texttodisplay;
      } else {
        res = texttodisplay.substring(1);
      }
    } else if (btnval == "<") {
      res = texttodisplay.substring(0, texttodisplay.length - 1);
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget CustomButton(String btnval, var textcolor, var fillcolor) {
    return SizedBox(
      width: 80,
      height: 45,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: () => btnClicked(btnval),
        child: Center(
          child: Text(
            btnval,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Color(textcolor)),
          ),
        ),
        color: Color(fillcolor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        title: Center(
          child: Text("Calculator"),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Text(
                  history,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFD6D6D6)),
                ),
                alignment: Alignment.bottomRight,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  texttodisplay,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                alignment: Alignment.bottomRight,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("AC", 0xFFFFFFFF, 0xFFB71C1C),
                    CustomButton("C", 0xFFFFFFFF, 0xFFB71C1C),
                    CustomButton("<", 0xFFFFFFFF, 0xFFB71C1C),
                    CustomButton("/", 0xFFFFFFFF, 0xFFF57F17),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("9", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("8", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("7", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("X", 0xFFFFFFFF, 0xFFF57F17),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("6", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("5", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("4", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("-", 0xFFFFFFFF, 0xFFF57F17),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("3", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("2", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("1", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("+", 0xFFFFFFFF, 0xFFF57F17),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("+/-", 0xFFFFFFFF, 0xFF2962FF),
                    CustomButton("0", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("00", 0xFFFFFFFF, 0xFF303030),
                    CustomButton("=", 0xFFFFFFFF, 0xFF00C853),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
