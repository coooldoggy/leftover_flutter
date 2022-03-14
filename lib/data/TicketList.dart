import 'package:flutter/cupertino.dart';
import 'package:leftover_flutter/data/TicketInfo.dart';
import 'package:leftover_flutter/data/DBHelper.dart';

class TicketList with ChangeNotifier{
  final List<TicketInfo> _ticketList =[];

  List<TicketInfo> get items => _ticketList;

  void refresh(){
    notifyListeners();
  }

  void add(TicketInfo item){
    DBHelper().insertTicket(item);
    _ticketList.add(item);
  }

  void delete(TicketInfo item){
    if(item.id != null){
      DBHelper().deleteTicket(item.id);
      _ticketList.remove(item);
    }
  }

  void clear(){
    _ticketList.clear();
  }

  void update(TicketInfo item){
    DBHelper().updateTicketInfo(item);
    clear();
    get();
    refresh();
  }

   List<TicketInfo> get(){
    _ticketList.clear();
     DBHelper().getAllTicket().then((value) => value.forEach((element) {
       _ticketList.add(element);
     }));
     notifyListeners();
     return _ticketList;
  }
}