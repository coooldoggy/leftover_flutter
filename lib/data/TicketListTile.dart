import 'package:flutter/cupertino.dart';

class TicketListTile with ChangeNotifier{
  final List<Container> _list = [];

  List<Container> get items => _list;

  void refresh(){
    notifyListeners();
  }

  void add(Container item) {
    _list.add(item);
    notifyListeners();
  }

  void delete(Container item){
    _list.remove(item);
    notifyListeners();
  }
}