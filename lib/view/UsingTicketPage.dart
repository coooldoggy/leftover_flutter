import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/data/DBHelper.dart';
import 'package:leftover_flutter/data/TicketInfo.dart';

class UsingTicketPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _UsingTicketPage();

}

class _UsingTicketPage extends State<UsingTicketPage>{
  late List<TicketInfo> ticketList;

  @override
  void initState() {
    super.initState();
    DBHelper().getAllTicket().then((value) =>
      value.forEach((element) {
        debugPrint("${element.name}");
        ticketList.add(element);
      })
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}