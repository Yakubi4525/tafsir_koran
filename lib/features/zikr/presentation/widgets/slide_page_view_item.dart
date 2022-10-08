import 'package:flutter/material.dart';
import 'package:tafsir/core/components/dialogs.dart';
import 'package:tafsir/core/components/message_dialog.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/features/zikr/domain/entities/zikr.dart';
import 'package:tafsir/features/zikr/presentation/widgets/tasbih_button.dart';
import 'package:tafsir/features/zikr/presentation/widgets/tasbih_widget.dart';

class SlidePageViewItem extends StatefulWidget {
  final Zikr zikr;
  final Function tasbihFunction;

  const SlidePageViewItem({Key key, this.zikr, this.tasbihFunction})
      : super(key: key);

  @override
  _SlidePageViewItemState createState() => _SlidePageViewItemState();
}

class _SlidePageViewItemState extends State<SlidePageViewItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.03),
                Container(
                  child: Text(
                    widget.zikr.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  child: Text(
                    widget.zikr.arabicText,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: 1,
                  color: primaryColor,
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlineButton(
                      highlightedBorderColor: primaryColor,
                      onPressed: () {
                        Dialogs.showUnmodal(
                          context,
                          MessageDialog(
                            title: "Tранкрипция",
                            text: widget.zikr.transcription,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TРАНСКРИПЦИИ",
                          style: TextStyle(color: blackColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  child: Text(
                    widget.zikr.translationRu,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "[" +
                            widget.zikr.scientist +
                            ", " +
                            widget.zikr.count.toString() +
                            " раза]",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProgressWidget(value: count, parts: widget.zikr.count),
                BouncingButton(
                  onPressed: () async {
                    setState(() {
                      count++;
                    });
                    if (count == widget.zikr.count) {
                      await Future.delayed(Duration(milliseconds: 1500));
                      widget.tasbihFunction();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
