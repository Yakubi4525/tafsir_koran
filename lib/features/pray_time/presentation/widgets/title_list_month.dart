import 'package:flutter/material.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/style/dimensions.dart';

class TitleListMonth extends StatelessWidget {
  const TitleListMonth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomText(text: '№', fontSize: 10.0,color: Colors.white,),flex: 1,),
        wSizedBox2,
        Expanded(child: CustomText(text: 'Фаджр', fontSize: 10.0,color: Colors.white,),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: 'Восход', fontSize: 10.0,color: Colors.white,),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: 'Зухр', fontSize: 10.0,color: Colors.white,),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: 'Аср', fontSize: 10.0,color: Colors.white,),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: 'Магриб', fontSize: 10.0,color: Colors.white,),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: 'Иша', fontSize: 10.0,color: Colors.white,),flex: 2,),
      ],
    );
  }
}
