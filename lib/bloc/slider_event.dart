class SliderEvent {}

class ChangeNumber extends SliderEvent {
  double value;

  ChangeNumber({required this.value});
}
