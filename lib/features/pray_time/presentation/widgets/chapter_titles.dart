import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/style/dimensions.dart';

class ChapterTitles extends StatelessWidget {
  ChapterTitles(
      {Key key,
      @required this.text1,
      @required this.fontSize,
      this.color,
      @required this.text2})
      : super(key: key);

  String text1;
  String text2;
  double fontSize;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomText(
            text: text1,
            fontSize: fontSize,
            color: color,
          ),
        ),
        Expanded(
          flex: 3,
          child: CustomText(
            text: text2,
            fontSize: fontSize,
            color: color,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(Icons.volume_down),
          ),
        ),
      ],
    );
  }
}
