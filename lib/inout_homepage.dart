import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice3/calculatorBrain.dart';
import 'package:practice3/components/constant.dart';
import 'reusableCard.dart';
import 'components/IconContents.dart';
import 'components/resultpage.dart';

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender {
  female,
  male
}

class _MyHomePageState extends State<MyHomePage> {

  Gender? selectedGender;
  int height = 180; 
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    
     

    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        backgroundColor: Color(0xFF0E1525),
      ),
      body: CustomScrollView(
        slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        //first row
                        Expanded(
                          child: Row(     
                          children: [
                            Expanded(
                              child: reusableCard(
                                  cardChild: IconContents(
                                    icon: FontAwesomeIcons.mars,
                                    label: 'Male',
                                  ),
                                  onPress: (){
                                    setState(() {
                                      selectedGender = Gender.male;
                                    });
                                  },
                                  colour: selectedGender == Gender.male ? kInactiveCardColor : kActiveCardColor,
                              )
                            ),
                            Expanded(
                              child: reusableCard(
                                  cardChild: IconContents(
                                    icon: FontAwesomeIcons.venus,
                                    label: 'Female',
                                  ),
                                  onPress: (){
                                    setState(() {
                                      selectedGender = Gender.female;
                                    });
                                  },
                                  colour: selectedGender == Gender.female ? kInactiveCardColor : kActiveCardColor,
                              )
                            ),
                          ],
                          )
                        ),
                        //second row
                        Expanded(
                          child: reusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Height' , style: kLabelTextStyle,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                          text: height.toString(),
                                          style: kNumberStyle,
                                          children: [
                                            TextSpan(
                                              text: 'cm',
                                              style: kLabelTextStyle
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(),
                                      child: Slider(
                                        value: height.toDouble(),
                                        min: 100.0,
                                        max: 250.0,
                                        onChanged: (double newValue) {
                                          setState(() {
                                            height = newValue.round();
                                          });
                                        },
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                            colour: kInactiveCardColor,
                          )
                        ),
                        //third row
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: reusableCard(
                                  onPress: (){},
                                  colour: kInactiveCardColor,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('WEIGHT',style: kLabelTextStyle,),
                                      Text(weight.toString(), style: kNumberStyle,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            IconButton(
                                            icon: Icon(FontAwesomeIcons.minus),
                                            color: Colors.indigo,
                                            highlightColor: Colors.lightBlueAccent,
                                            iconSize: 30.0,
                                            hoverColor: Colors.lightBlueAccent,
                                            onPressed: (){
                                              setState(() {
                                                weight--;
                                              });
                                            },
                                          ),
                                          SizedBox(width: 30,),
                                          IconButton(
                                            icon: Icon(FontAwesomeIcons.plus),
                                            color: Colors.indigo,
                                            highlightColor: Colors.lightBlueAccent,
                                            iconSize: 30.0,
                                            hoverColor: Colors.lightBlueAccent,
                                            onPressed: (){
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              ),


                              Expanded(
                                child: reusableCard(
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text('AGE',style: kLabelTextStyle,),
                                        Text(age.toString(),style: kNumberStyle,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: 20,
                                              child: IconButton(
                                                onPressed: (){
                                                  setState(() {
                                                    age--;
                                                  });
                                                },
                                                padding: EdgeInsets.zero,
                                                color: Colors.white,
                                                icon: Icon(FontAwesomeIcons.minus),
                                              ),
                                            ),
                                            SizedBox(width: 30,),
                                             CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: 20,
                                              child: IconButton(
                                                onPressed: (){
                                                  setState(() {
                                                    age++;
                                                  });
                                                },
                                                padding: EdgeInsets.zero,
                                                color: Colors.white,
                                                icon: Icon(FontAwesomeIcons.plus),
                                              ),
                                            )
                                          ],
                                        )
                                    ],
                                  ),
                                  onPress: (){},
                                  colour: kInactiveCardColor,
                                ),
                              ),
                            ],
                          )
                        ),
                      ],
                    )
                    ),
                  //bottomButton
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                          CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResultPage(
                              resultText: calc.getResult()  ,
                              bmiResult: calc.calculateBMI().toStringAsFixed(1),
                              interpratation: calc.getInterpretation() ,
                            ))
                          );
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text('CALCULATE',style: kLargeButtonTextStyle,),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.red
                        ),
                      ),
                    )
                  )
                ],
        ),
            )
        ],
      )
    );
  }
}



