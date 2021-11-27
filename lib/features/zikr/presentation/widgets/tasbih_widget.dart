import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';

class ProgressWidget extends StatefulWidget {
  final int value;
  final int parts;
  const ProgressWidget({
    Key key, this.value, this.parts,
   
  }) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with TickerProviderStateMixin {
   AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: widget.parts.toDouble(),
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.animateTo(widget.value.toDouble());
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            valueColor:  AlwaysStoppedAnimation<Color>(primaryColor),
            strokeWidth: 5,
            value: controller.value/widget.parts,
            backgroundColor: Colors.grey,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.value}',
              style:  TextStyle(
                color: widget.value == widget.parts ? primaryColor : blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '/${widget.parts}',
              style: TextStyle(
                color: blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    );
  }
}
