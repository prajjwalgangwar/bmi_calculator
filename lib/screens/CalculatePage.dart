import 'package:bmi_calculator/AppConstants.dart';
import 'package:bmi_calculator/bmi/bmi_bloc.dart';
import 'package:bmi_calculator/bmi/bmi_event.dart';
import 'package:bmi_calculator/bmi/bmi_state.dart';
import 'package:bmi_calculator/widgets/genderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CalculatePage extends StatelessWidget {
  double value = 100.0;
  int age = 25;
  int weight = 60;
  var agruments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    BmiBloc bloc = BlocProvider.of<BmiBloc>(context);

    print(bloc.state);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: BlocConsumer<BmiBloc, BmiState>(
        listener: (context, state) {
          if (state is SliderState) {
            value = state.newValue;
          }
          if (state is AgeCounterState) {
            age = state.ageCounter;
          }
          if (state is WeightCounterState) {
            weight = state.weightCounter;
          }
          if (state is CalculateState) {
            Get.defaultDialog(
                radius: 10,
                contentPadding: EdgeInsets.all(30),
                confirm: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.blue.shade50))),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.blue.shade50),
                    ),
                  ),
                ),
                backgroundColor: state.color,
                title: 'Your BMI : ${state.bmi_value}',
                titlePadding: EdgeInsets.only(top: 50),
                titleStyle: TextStyle(color: Colors.blue.shade50),
                middleText: 'You are ${state.bmi_text}',
                middleTextStyle: TextStyle(color: Colors.blue.shade50));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: GenderCard(
                    imageURL: agruments[1] ?? AppConstants.nota,
                    genderText: agruments[0] ?? '',
                    widthX: MediaQuery.of(context).size.width / 1.3,
                    heightY: MediaQuery.of(context).size.height / 1.6,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.purple.shade900,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 10),
                          child: Text(
                            'SELECT HEIGHT',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${value.round()}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: ' cm',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black))
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Slider(
                                activeColor: Colors.purple.shade900,
                                inactiveColor: Colors.purple.shade100,
                                min: 1,
                                max: 300,
                                value: value,
                                onChanged: (newValue) {
                                  bloc.add(SliderEvent(newValue));
                                }))
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Card(
                          shadowColor: Colors.purple.shade900,
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  'WEIGHT',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                '${weight}',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w700),
                              ),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: IconButton(
                                            onPressed: () {
                                              bloc.add(WeightCounterEvent(
                                                  weight, false));
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: IconButton(
                                            onPressed: () {
                                              bloc.add(WeightCounterEvent(
                                                  weight, true));
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Card(
                          shadowColor: Colors.purple.shade900,
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  'AGE',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                '${age}',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w700),
                              ),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: IconButton(
                                            onPressed: () {
                                              bloc.add(
                                                  AgeCounterEvent(age, false));
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: IconButton(
                                            onPressed: () {
                                              bloc.add(
                                                  AgeCounterEvent(age, true));
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        bloc.add(CalculateEvent(height: value, weight: weight));
                      },
                      color: Colors.purple.shade900,
                      child: Text(
                        'CALCULATE BMI',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
