import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/pray_controller.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/core/constants/constants.dart';
import 'package:tafsir/core/style/dimensions.dart';
import 'package:tafsir/features/pray_time/presentation/widgets/title_list_month.dart';

class TimePrayTheMonth extends StatelessWidget {
  TimePrayTheMonth({Key key}) : super(key: key);

  final listPray = Get.find<PrayController>().listPray;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: '${listPray.data[1].dataTimePray.gregorian.month.enMonth}', fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(mediaHeight(context)/70),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(mediaHeight(context)/100),
                child: TitleListMonth(),
              ),
            ),
            hSizedBox1,
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) => buildListPray(index, context),
                  separatorBuilder: (context,index) => SizedBox(height: 3,),
                  itemCount: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListPray(int index, BuildContext context) =>  Padding(
    padding: EdgeInsets.all(mediaHeight(context)/100),
    child: Row(
      children: [
        Expanded(child: CustomText(text: '${index+1}', fontSize: 12.0),flex: 1,),
        wSizedBox2,
        Expanded(child: CustomText(text: '${listPray.data[index].timingsPray.fajr.substring(0,5)}', fontSize: 12.0),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: '${listPray.data[index].timingsPray.sunrise.substring(0,5)}', fontSize: 12.0),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: '${listPray.data[index].timingsPray.dhuhr.substring(0,5)}', fontSize: 12.0),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: '${listPray.data[index].timingsPray.asr.substring(0,5)}', fontSize: 12.0),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: '${listPray.data[index].timingsPray.maghrib.substring(0,5)}', fontSize: 12.0),flex: 2,),
        wSizedBox2,
        Expanded(child: CustomText(text: '${listPray.data[index].timingsPray.isha.substring(0,5)}', fontSize: 12.0),flex: 2,),
      ],
    ),
  );
}
