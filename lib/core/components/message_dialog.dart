import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tafsir/core/components/main_dialog.dart';
import 'main_button.dart';




class MessageDialog extends StatelessWidget {

  final String title;
  final String text;

  MessageDialog({this.title, this.text});

  Widget buildText() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: Text(text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),
      )
    );
  }

  Widget buildButton(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      alignment: Alignment.center,
      child: MainButton(
        title: 'Вернуться назад',
        height: 40,
        width: width * 0.3,
        fontSize: 14,
        onPressed: ()=> Navigator.pop(context),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainDialog(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildText(),
          buildButton(context)
        ],
      ),
    );
  }
}
