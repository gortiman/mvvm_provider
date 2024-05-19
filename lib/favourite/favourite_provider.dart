import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier{
  List<int> _isFav = [];
  List<int> get isFav=> _isFav;

  void addItem(int value){
    _isFav.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _isFav.remove(value);
    notifyListeners();
  }
}