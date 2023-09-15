import 'dart:math';

import 'package:calculator/CalculatorBtn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR" , style: TextStyle(fontFamily: 'MaterialIcons'),),
        backgroundColor: Colors.black87,
      ),
      body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(transform: GradientRotation(2),
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [Colors.black87,Colors.red, Colors.black87])),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Text(result,
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorBtn(btntxt: "AC", OnButtonClickCallBack: onACclick),
                    CalculatorBtn(
                        btntxt: "<", OnButtonClickCallBack: onBackSpace),
                    CalculatorBtn(btntxt: "^2", OnButtonClickCallBack: power),
                    CalculatorBtn(
                        btntxt: ("sqrt"), OnButtonClickCallBack: squareRoot),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorBtn(
                        btntxt: "7", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "8", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "9", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "/", OnButtonClickCallBack: onOperatorClick),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorBtn(
                        btntxt: "4", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "5", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "6", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "-", OnButtonClickCallBack: onOperatorClick),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorBtn(
                        btntxt: "1", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "2", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "3", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "+", OnButtonClickCallBack: onOperatorClick),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorBtn(
                        btntxt: ".", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "0", OnButtonClickCallBack: onDigitClick),
                    CalculatorBtn(
                        btntxt: "=", OnButtonClickCallBack: onEqualClick),
                    CalculatorBtn(
                        btntxt: "*", OnButtonClickCallBack: onOperatorClick),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDigitClick(String btnText) {
    if (btnText == '.') {
      if (result.contains('.')) {
        return;
      }
    }

    print("Click on $btnText");
    setState(() {
      result += btnText;
    });
  }

  String savedNumber = '';
  String savedOperator = '';

  void onOperatorClick(String btnText) {
    if (savedNumber.isEmpty) {
      savedNumber = result;
      savedOperator = btnText;
      setState(() {
        result = '';
      });
    } else if (result.isEmpty && savedOperator.isNotEmpty) {
      savedOperator = btnText;
    } else {
      String newNumber = result;
      String res = calculate(savedNumber, savedOperator, newNumber);
      savedNumber = res;
      savedOperator = btnText;
      setState(() {
        result = '';
      });
    }
  }

  String calculate(String left, String Operator, String right) {
    double n1 = double.parse(left);
    double n2 = double.parse(right);
    double res = 0;

    if (Operator == '+') {
      res = n1 + n2;
    } else if (Operator == '-') {
      res = n1 - n2;
    } else if (Operator == '/') {
      res = n1 / n2;
    } else if (Operator == '*') {
      res = n1 * n2;
    }
    return res.toString();
  }

  void onEqualClick(String _) {
    String newNumber = result;
    String res = calculate(savedNumber, savedOperator, newNumber);

    setState(() {
      result = res;
    });
    savedOperator = '';
    savedNumber = '';
  }

  void onACclick(String _) {
    setState(() {
      savedNumber = '';
      savedOperator = '';
      result = '';
    });
  }

  void onBackSpace(String _) {
    if (result.isNotEmpty) {
      setState(() {
        result = '';
      });
    }
  }

  void power(String _) {
    num n = pow(double.parse(result), 2);

    setState(() {
      result = n.toString();
      savedNumber = '';
      savedOperator = '';
    });
  }

  void squareRoot(String _) {
    double x = double.parse(result);
    double n = sqrt(x);

    setState(() {
      result = n.toString();
    });
  }
}
