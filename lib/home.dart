import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_column.dart';
import 'custom_container.dart';
import 'dart:math';

enum g { m, f }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final activeColor = const Color.fromRGBO(51, 255, 0, 0.302);
  final inactiveColor = Colors.white12;
  g? isSelected;

  int weight = 100;
  int height = 360;
  int age = 25;
  String bmi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GFG Custom Widget'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: isSelected == g.m ? activeColor : inactiveColor,
                      onTap: () {
                        setState(() {
                          isSelected = g.m;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'FEMALE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: isSelected == g.f ? activeColor : inactiveColor,
                      onTap: () {
                        setState(() {
                          isSelected = g.f;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'MALE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomContainer(
                color: inactiveColor,
                height: 100,
                child: CustomColumn(
                  text: 'HEIGHT $height cm',
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.green,
                      overlayColor: const Color(0x2900ff00),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.floor();
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: inactiveColor,
                      child: CustomColumn(
                        text: 'WEIGHT $weight',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                                icon: Icons.arrow_downward,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                                icon: Icons.arrow_upward,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: inactiveColor,
                      child: CustomColumn(
                        text: 'Age $age',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                                icon: Icons.arrow_downward,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                                icon: Icons.arrow_upward,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      onTap: () {
                        setState(() {
                          bmi = '';
                        });
                      },
                      width: double.infinity,
                      child: Text(
                        'CLEAR',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: activeColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      onTap: () {
                        double _bmi = weight / pow(height / 100, 2);

                        setState(() {
                          bmi = _bmi.toStringAsFixed(1);
                        });
                      },
                      width: double.infinity,
                      child: Text(
                        'GET BMI',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: CustomContainer(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your BMI IS',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmi,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  color: inactiveColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
