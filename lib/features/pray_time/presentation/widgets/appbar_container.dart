import 'package:flutter/material.dart';

class AppbarContainer extends StatelessWidget {
  const AppbarContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/mosque.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height/2.4,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: MediaQuery.of(context).size.height/2.4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.white,
                Colors.white,
                Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1, 0, 1],
            ),
          ),
        ),
      ],
    );
  }
}
