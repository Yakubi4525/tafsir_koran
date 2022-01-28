import 'package:flutter/material.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/constants/constants.dart';

class TitlePrayen extends StatelessWidget {
  const Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: 'Parer',
          fontSize: 20,
          color: Colors.grey,
        ),
        Spacer(),
        CustomText(
          text: 'Adhan',
          fontSize: 20,
          color: Colors.grey,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset('$urlImage/squares.png',),
        ),
      ],
    );
  }
}
