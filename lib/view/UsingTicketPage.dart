import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/data/DBHelper.dart';
import 'package:leftover_flutter/data/TicketInfo.dart';
import 'package:leftover_flutter/style/colors.dart';
import 'package:leftover_flutter/style/font.dart';
import 'package:provider/provider.dart';

import 'NewTicketPage.dart';

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

    var list = List.generate(
        ticketList.length,
        (index) => Container(
              width: 106,
              height: 106,
              child: InkWell(
                onTap: null,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(ticketList[index].name, style: ticketNameStyle),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(ticketList[index].color), width: 2)),
                ),
              ),
            ));
    list.insert(
        0,
        Container(
            width: 106,
            height: 106,
            child: IconButton(
              icon: Icon(Icons.add, color: LeftOverColor.very_light_pink),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewTicketPage()))
              },
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: LeftOverColor.very_light_pink, width: 2))));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getTicketData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData == false){
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }else{
            return Center(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  padding: EdgeInsets.fromLTRB(6, 15, 6, 6),
                  mainAxisSpacing: 20,
                  children: _buildTicketGridList(context),
                ),
              ),
            );
          }
        },
      )
    );
  }

  Future<void> _getTicketFromDB() async{
    ticketList.clear();
    var tickets = DBHelper().getAllTicket().then((value) => value.forEach((element) {
      ticketList.add(element);
    }));
    return tickets;
  }

  Future<int> _getTicketData() async {
    var result = await _getTicketFromDB();
    return ticketList.length;
  }

}
