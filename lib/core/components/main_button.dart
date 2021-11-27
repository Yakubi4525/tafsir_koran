import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';

class MainButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final String title;
  final Widget child;
  final EdgeInsets margin;
  final Function onPressed;
  final Color textColor;
  final Color buttonColor;

  const MainButton({
    this.title,
    this.width,
    this.height = 50,
    this.fontSize = 18,
    this.child,
    this.margin,
    this.onPressed, this.textColor=Colors.white, this.buttonColor=Colors.black
  });

  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
        border: Border.all(color: primaryColor)
      ),
      child: FlatButton(
        onPressed: onPressed,
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 1),
          child: child ??
              Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600),
              ),
        ),
      ),
    );
  }
}
