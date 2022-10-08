import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/constants/constants.dart';

class TitlePray extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: 'Намаз',
          fontSize: 20,
          color: Colors.grey,
        ),
        Spacer(),
        CustomText(
          text: 'Время',
          fontSize: 20,
          color: Colors.grey,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: (){
              Get.toNamed('/time_list');
            },
            icon: Image.asset(
              '$urlImage/squares.png',
            ),
          )
        ),
      ],
    );
  }
}
