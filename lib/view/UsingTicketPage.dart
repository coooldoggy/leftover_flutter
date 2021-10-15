import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/data/DBHelper.dart';
import 'package:leftover_flutter/data/TicketInfo.dart';
import 'package:leftover_flutter/style/colors.dart';
import 'package:leftover_flutter/style/font.dart';

class UsingTicketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsingTicketPage();
}

class _UsingTicketPage extends State<UsingTicketPage> {
  List<TicketInfo> ticketList = [];

  var ticketNameStyle = TextStyle(
      color: LeftOverColor.text_black,
      fontFamily: LeftOverTextStyle.notoSans,
      fontWeight: FontWeight.bold,
      fontSize: 18);

  List<Container> _buildTicketGridList(BuildContext context) {
    // var notiTicketList = Provider.of<TicketListTile>(context);

    var list = List.generate(
        ticketList.length,
        (index) => Container(
              width: 106,
              height: 106,
              child: InkWell(
                onTap: null,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(ticketList[index].name,style: ticketNameStyle),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Color(ticketList[index].color)
                    ], stops: [0.5,1], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    // color: Color(ticketList[index].color),
                      border: Border.all(
                          color: Color(ticketList[index].color), width: 2)
                  ),
                ),
              ),
            ));
    // list.forEach((element) {
    //   notiTicketList.add(element);
    // });

    list.insert(
        0,
        Container(
            width: 106,
            height: 106,
            child: IconButton(
              icon: Icon(Icons.add, color: LeftOverColor.very_light_pink),
              onPressed: null,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: LeftOverColor.very_light_pink, width: 2))));

    return list;
  }

  @override
  void initState() {
    super.initState();
    DBHelper().getAllTicket().then((value) => value.forEach((element) {
          debugPrint("${element.name}");
          ticketList.add(element);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: GridView.count(
            crossAxisCount: ticketList.length,
            childAspectRatio: 3 / 2,
            padding: EdgeInsets.fromLTRB(6, 15, 6, 6),
            mainAxisSpacing: 20,
            children: _buildTicketGridList(context),
          ),
        ),
      ),
    );
  }
}
