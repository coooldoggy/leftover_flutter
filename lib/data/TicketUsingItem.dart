import 'package:flutter/cupertino.dart';

class TicketUsingItem with ChangeNotifier{
  final List<Container> _list = [];

  List<Container> get items => _list;

  void refresh(){
    notifyListeners();
  }

  //FIXME data type 으로 바꿀지 고민
  void add(Container item) {
    _list.add(item);
    notifyListeners();
  }

  void delete(Container item){
    _list.remove(item);
    notifyListeners();
  }
}