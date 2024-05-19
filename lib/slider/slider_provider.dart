import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier{
  double _sliderValue = 1.0;
  double get sliderValue => _sliderValue;

  void slider(double value){
    _sliderValue = value;
    notifyListeners();
  }
}