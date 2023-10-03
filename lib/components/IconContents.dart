import 'package:flutter/material.dart';
import 'constant.dart';

class IconContents extends StatelessWidget {
  const IconContents({
    this.icon,
    this.label,
  });

    final IconData? icon;
    final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50,),
        Text(label.toString(), style: kLabelTextStyle,)
      ],
    );
  }
}