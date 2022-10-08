import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';

class CustomButton extends StatelessWidget {

  final double height;
  final String text;
  final onPressed;

  const CustomButton({Key key, @required this.height, @required this.text,@required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      child:ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 18.0,fontFamily: 'DisplayRegular',),
          )),
    );
  }
}
