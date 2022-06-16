abstract class BmiEvent {}

class InitialEvent extends BmiEvent {}

class AgeCounterEvent extends BmiEvent {
  final bool tf;
  final int ageCounter;

  AgeCounterEvent(this.ageCounter, this.tf);
}

class WeightCounterEvent extends BmiEvent {
  final int weightCounter;
  final bool tf;

  WeightCounterEvent(this.weightCounter, this.tf);
}

class SliderEvent extends BmiEvent {
  final double value;

  SliderEvent(this.value);
}

class CalculateEvent extends BmiEvent {
  final double height;
  final int weight;

  CalculateEvent({required this.height, required this.weight});
}
