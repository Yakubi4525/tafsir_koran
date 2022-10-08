import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({Key key, this.onTap, this.tittle}) : super(key: key);
  final Function onTap;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), color: primaryColor),
      child: InkWell(
        onTap: onTap,
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tittle,
            style: TextStyle(
              color: blackColor,
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}
