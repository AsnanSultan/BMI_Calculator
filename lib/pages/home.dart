import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/pages/resultPage.dart';
import 'package:bmi_calculator/widget/backgroundBox.dart';
import 'package:bmi_calculator/widget/boxIconText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const activeColor = Color(0xFF1D1E33);
const deActiveColor = Color(0xFF111328);
enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender = Gender.male;
  int sliderHight = 180;
  int sliderWight = 60;
  int sliderAge = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("BMI Calculator"),
          ),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: BackgroundBox(
                          color: selectedGender == Gender.male
                              ? activeColor
                              : deActiveColor,
                          cardWidget: BoxIconText(
                            icon: Icons.male,
                            text: "MALE",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: BackgroundBox(
                          color: selectedGender == Gender.female
                              ? activeColor
                              : deActiveColor,
                          cardWidget: BoxIconText(
                            icon: Icons.female,
                            text: "FEMALE",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BackgroundBox(
                          color: Color(0xFF1D1E33),
                          cardWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HEIGHT",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF8D8E98),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    sliderHight.toString(),
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    "cm",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF8D8E98),
                                    ),
                                  ),
                                ],
                              ),
                              Slider(
                                value: sliderHight.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                activeColor: Color(0xFFEB1555),
                                inactiveColor: Color(0xFF8D8E98),
                                onChanged: (double newValue) {
                                  setState(() {
                                    sliderHight = newValue.round();
                                  });
                                },
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BackgroundBox(
                          color: Color(0xFF1D1E33),
                          cardWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "WEIGHT",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF8D8E98),
                                ),
                              ),
                              Text(
                                sliderWight.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIcon(
                                      iconData: CupertinoIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          sliderWight--;
                                        });
                                      }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIcon(
                                      iconData: Icons.add,
                                      onPress: () {
                                        setState(() {
                                          sliderWight++;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                      child: BackgroundBox(
                          color: Color(0xFF1D1E33),
                          cardWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AGE",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF8D8E98),
                                ),
                              ),
                              Text(
                                sliderAge.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIcon(
                                      iconData: CupertinoIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          sliderAge--;
                                        });
                                      }),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIcon(
                                      iconData: CupertinoIcons.add,
                                      onPress: () {
                                        setState(() {
                                          sliderAge++;
                                        });
                                      })
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Calculator cal =
                      new Calculator(hight: sliderHight, weigth: sliderWight);
                  String bmi = cal.calculateBMI();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              text1: cal.getResult(),
                              text2: bmi,
                              text3: cal.getInterpretation())));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 80.0,
                ),
              ),
            ],
          )),
    );
  }
}

class RoundIcon extends StatelessWidget {
  final IconData iconData;
  final onPress;

  RoundIcon({required this.iconData, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconData,
        size: 30,
        color: Colors.white,
      ),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 46.0,
        width: 46.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
