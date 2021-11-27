import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainCard extends StatelessWidget {

  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets shadowPadding;
  final BorderRadius borderRadius;
  final Widget child;
  final Color color;

  MainCard(
    {
      this.margin,
      this.borderRadius,
      this.padding,
      this.child,
      this.color = Colors.white,
      this.shadowPadding
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: shadowPadding ?? EdgeInsets.only(bottom: 13, top: 6),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3)
            )
          ]
        ),
        child: child,
      )
    );
  }
}
