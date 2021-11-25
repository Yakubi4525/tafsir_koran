import 'package:flutter/material.dart';

class PrayTimePage extends StatelessWidget {
  const PrayTimePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
        child: Text('Экран время намаза'),
      ),
    );
  }
}
