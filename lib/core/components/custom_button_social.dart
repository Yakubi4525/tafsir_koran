import 'package:flutter/material.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/style/dimensions.dart';

class ButtonSocial extends StatelessWidget {

  final String textImage;
  final String text;
  final onPressed;

  const ButtonSocial({Key key, @required this.textImage, @required this.text, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            wSizedBox2,
            Image.asset(textImage),
            wSizedBox3,
            CustomText(
              color: Colors.black,
              text: text,
              fontSize: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
