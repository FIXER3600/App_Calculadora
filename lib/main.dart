import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String showText = '0';
  String? txtButton;

  double num1 = 0;
  double num2 = 0;
  String? op;
  String cache = '';
  String result = '';

  void calc(String txtButton) {
   
    if (txtButton == 'AC') {
      setState(() {
        num1 = 0;
        num2 = 0;
        result = '0';
        op = '';
        cache = '';
      });
    } else if (txtButton == '%') {
      num1 = double.parse(showText);
      double n = (num1 / 100);
      result = n.toStringAsFixed(0);
      setState(() {
        showText = result;
        cache = '$num1 %';
      });
    } // ÷
    else if (txtButton == '÷') {
      num1 = double.parse(showText);
      op = txtButton;
      setState(() {
        cache = '$num1 $op';
        showText = '$num1';
        if (cache == '$num1 $op') {
          result = '$num2';
        } else {
          result = '';
        }
      });
    } // X
    else if (txtButton == 'x') {
      num1 = double.parse(showText);
      op = txtButton;
      setState(() {
        cache = '$num1 $op';
        showText = '$num1';
        if (cache == '$num1 $op') {
          result = '$num2';
        } else {
          result = '';
        }
      });
    } // -
    else if (txtButton == '-') {
      num1 = double.parse(showText);
      op = txtButton;

      setState(() {
        cache = '$num1 $op';
        showText = '$num1';
        if (cache == '$num1 $op') {
          result = '$num2';
        } else {
          result = '';
        }
      });
    } // +
    else if (txtButton == '+') {
      // add Number 1 and add op later clear result
      num1 = double.parse(showText);
      op = txtButton;
      setState(() {
        cache = '$num1 $op';
        showText = '$num1';
        if (cache == '$num1 $op') {
          cache = '$num1 $op $num2';
          result = '$num2';
        } else {
          result = '';
        }
      });
    } // =
    else if (txtButton == '=') {
      // +
      if (op == '+') {
        num2 = double.parse(showText);
        result = (num1 + num2).toString();
        setState(() {
          cache = '$num1 $op $num2';
        });
      } // -
      else if (op == '-') {
        num2 = double.parse(showText);
        result = (num1 - num2).toString();
        setState(() {
          cache = '$num1 $op $num2';
        });
      } // ÷
      else if (op == '÷') {
        num2 = double.parse(showText);
        result = (num1 / num2).toString();
        setState(() {
          showText = result;
          cache = '$num1 $op $num2';
        });
      } // X
      else if (op == 'x') {
        num2 = double.parse(showText);
        result = (num1 * num2).toString();
        setState(() {
          showText = result;
          cache = '$num1 $op $num2';
        });
      }
      setState(() {
        showText = result;
      });
    } else {
      if (result == 'error') {
        setState(() {
          showText = '';
          result = double.parse(showText + txtButton).toString();
        });
      } else {
        setState(() {
          result = double.parse(showText + txtButton).toString();
        });
      }
    }
    showText = result;
  }

  Widget button(color, text, colorText) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () => {calc(text)},
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: color),
        child: Text(text, style: TextStyle(fontSize: 21, color: colorText)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidht = screenInfo.size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text(
                          '$cache',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 30),
                      child: Text(
                        '$showText',
                        style: TextStyle(fontSize: 80, color: Colors.white,
                       ),
                      ),),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: button(Colors.grey, 'AC', Colors.black),
                              ),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: button(Colors.grey, '+/-', Colors.black),
                              ),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: button(Colors.grey, '%', Colors.black),
                              ),
                              SizedBox(
                                  width: 80,
                                  height: 80,
                                  child:
                                      button(Colors.orange, "÷", Colors.white)),
                            ]),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: button(
                                        Color.fromARGB(255, 66, 66, 66),
                                        "7",
                                        Colors.white)),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      "8", Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      "9", Colors.white),
                                ),
                                SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: button(
                                        Colors.orange, "x", Colors.white)),
                              ])),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      "4", Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      "5", Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      "6", Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child:
                                      button(Colors.orange, "-", Colors.white),
                                )
                              ])),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      '1', Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      '2', Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      '3', Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child:
                                      button(Colors.orange, '+', Colors.white),
                                )
                              ])),
                      Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: screenWidht / 2.45,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      '0', Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: button(Color.fromARGB(255, 66, 66, 66),
                                      '.', Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child:
                                      button(Colors.orange, '=', Colors.white),
                                ),
                              ])),
                    ]))));
  }
}
