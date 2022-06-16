import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/bmi/bmi_event.dart';
import 'package:bmi_calculator/bmi/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(InitialState()) {
    on<InitialEvent>(initial);
    on<SliderEvent>(slider);
    on<AgeCounterEvent>(age);
    on<WeightCounterEvent>(weight);
    on<CalculateEvent>(onCalculate);
  }

  void initial(InitialEvent event, Emitter<BmiState> emit) async {
    try {
      emit(InitialState());
    } catch (e) {
      print(e);
    }
  }

  void slider(SliderEvent event, Emitter<BmiState> emit) async {
    try {
      emit(SliderState(event.value));
    } catch (e) {
      print('error in slider state');
    }
  }

  void age(AgeCounterEvent event, Emitter<BmiState> emit) async {
    try {
      if (event.tf && event.ageCounter < 120) {
        emit(AgeCounterState(ageCounter: event.ageCounter + 1));
      } else if (!(event.tf) && event.ageCounter > 0) {
        emit(AgeCounterState(ageCounter: event.ageCounter - 1));
      }
    } catch (e) {
      print('error in slider state');
    }
  }

  void weight(WeightCounterEvent event, Emitter<BmiState> emit) async {
    try {
      if (event.tf && event.weightCounter < 220) {
        emit(WeightCounterState(weightCounter: event.weightCounter + 1));
      } else if (!(event.tf) && event.weightCounter > 0) {
        emit(WeightCounterState(weightCounter: event.weightCounter - 1));
      }
    } catch (e) {
      print('error in slider state');
    }
  }

  void onCalculate(CalculateEvent event, Emitter<BmiState> emit) async {
    try {
      var h = event.height / 100;
      print('value of height = $h');
      h = h * h;
      print('value of height = $h');
      var bmi = event.weight / h;
      print('value of height = $bmi');

      if (bmi < 18.5) {
        emit(CalculateState(
            Colors.blue.shade900, bmi.toStringAsFixed(2), 'underweight'));
      } else if (bmi < 24.9) {
        emit(CalculateState(
            Colors.green.shade900, bmi.toStringAsFixed(2), 'normal'));
      } else if (bmi < 29.9) {
        emit(CalculateState(
            Colors.red.shade300, bmi.toStringAsFixed(2), 'overweight'));
      } else if (bmi < 34.9) {
        emit(CalculateState(
            Colors.red.shade700, bmi.toStringAsFixed(2), 'obese'));
      } else {
        emit(CalculateState(
            Colors.red.shade900, bmi.toStringAsFixed(2), 'severe obese'));
      }
    } catch (e) {
      print('Error in calculating BMI');
    }
  }
}
