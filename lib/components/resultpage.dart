import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:practice3/inout_homepage.dart';
import 'package:practice3/reusableCard.dart';


class ResultPage extends StatelessWidget {
  ResultPage({required this.resultText, required this.bmiResult, required this.interpratation});

  final String resultText;
  final String bmiResult;
  final String interpratation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusableCard(
              cardChild: Column(
                children: [
                  Text(resultText, style: kResultTextStyle,),
                  Text( bmiResult, style: kBMITextStyle,),
                  Text(interpratation, style: kBodyTextStyle,
                  textAlign: TextAlign.center,)
                ],
              ),
              colour: kActiveCardColor,
            ))
        ],
      ),
    );
  }
}