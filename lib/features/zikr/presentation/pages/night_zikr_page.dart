import 'package:flutter/material.dart';

class NightZikrPage extends StatelessWidget {
  const NightZikrPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
        child: Text('Экран зикр вечером'),
      ),
    );
  }
}
