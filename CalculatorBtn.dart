import 'package:flutter/material.dart';

typedef OnCalculatorClickCallBack = void Function (String);

class CalculatorBtn extends StatelessWidget {
  String btntxt;
  OnCalculatorClickCallBack OnButtonClickCallBack ;
  CalculatorBtn({required this.btntxt , required this.OnButtonClickCallBack}
      ){}

  @override
  Widget build(BuildContext context) {
    return
      Expanded(child: Container(
          margin: EdgeInsets.all(2),

          child: ElevatedButton(onPressed: () {
            OnButtonClickCallBack(btntxt);
  }
  , child: Text(btntxt , style: TextStyle(color: Colors.white , fontSize: 36),)
          , style: ElevatedButton.styleFrom(backgroundColor: Colors.black ,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)

      )
      ))));


  }

}