import 'package:flutter/cupertino.dart';

class ColorListTile with ChangeNotifier{
  final List<Container> _list = [];

  List<Container> get items => _list;

  void refresh(){
    notifyListeners();
  }

  void add(Container item) {
    _list.add(item);
  }
}