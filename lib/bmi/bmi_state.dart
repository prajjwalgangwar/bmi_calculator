import 'package:flutter/material.dart';

abstract class BmiState {}

class InitialState extends BmiState {}

class AgeCounterState extends BmiState {
  final int ageCounter;

  AgeCounterState({required this.ageCounter});
}

class WeightCounterState extends BmiState {
  final int weightCounter;

  WeightCounterState({required this.weightCounter});
}

class SliderState extends BmiState {
  final double newValue;

  SliderState(this.newValue);
}

class CalculateState extends BmiState {
  final Color color;
  final String bmi_value;
  final String bmi_text;

  CalculateState(this.color, this.bmi_value, this.bmi_text);
}
