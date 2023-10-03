import 'package:flutter/material.dart';



class reusableCard extends StatelessWidget {
  const reusableCard({
    this.colour,
    this.onPress,
    this.cardChild,
  });

    final colour;
    final Function? onPress;
    final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress != null ? () => onPress!() : null ,
      child: Container(
        child: cardChild,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colour,
          ),
        ),
    );
  }
}
