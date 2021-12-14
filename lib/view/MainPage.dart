import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leftover_flutter/data/DBHelper.dart';
import 'package:leftover_flutter/data/TicketInfo.dart';
import 'package:leftover_flutter/style/font.dart';
import 'package:leftover_flutter/view/NewTicketPage.dart';
import 'package:leftover_flutter/view/TicketsListPage.dart';
import 'package:leftover_flutter/style/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  List<TicketInfo> ticketList = [];

  var ticketNameStyle = TextStyle(
      color: LeftOverColor.text_black,
      fontFamily: LeftOverTextStyle.notoSans,
      fontWeight: FontWeight.bold,
      fontSize: 18);

  Widget? _buildTicketEnrolledList(BuildContext context) {
    debugPrint("${ticketList.first.name}");
    if (ticketList.isEmpty) {
      return emptyText;
    } else {
        return
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

              ),
              ListView(
                children: [

                ],
              )
            ]);
    }
  }

  List<Widget>? getTicketWidget(){
    List.generate(ticketList.length, (index) =>
        Container(
          alignment: Alignment.centerLeft,
          child: Text(ticketList[index].name, style: ticketNameStyle),
        )
    );
  }

  var emptyText = Expanded(
      child: Align(
          alignment: Alignment.center,
          child: Text(
            '등록된 정보가 없습니다.',
            style: TextStyle(color: Colors.grey),
          )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '남은거',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: SvgPicture.asset('assets/resources/iconhand.svg'),
              onPressed: () => null),
          actions: [
            IconButton(
                onPressed: () =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketListPage()))
                },
                icon: Image.asset('assets/resources/icon-ticket.png'))
          ],
          centerTitle: false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewTicketPage()))
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          foregroundColor: LeftOverColor.logo_purpley,
        ), // This trailing comma makes auto-formatting nicer for build methods.
        body: FutureBuilder(
          future: _getTicketData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Container(
                child: Stack(
                  children: <Widget>[
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      availableCalendarFormats: const {
                        CalendarFormat.month: '월',
                        CalendarFormat.week: '주',
                      },
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      locale: 'ko_kr',
                    ),
                    Positioned(
                      child: _buildTicketEnrolledList(context)!,)
                  ],
                ),
              );
            }
          },
        ));
  }

  Future<void> _getTicketFromDB() async {
    ticketList.clear();
    var tickets =
    DBHelper().getAllTicket().then((value) =>
        value.forEach((element) {
          ticketList.add(element);
        }));
    return tickets;
  }

  Future<int> _getTicketData() async {
    var result = await _getTicketFromDB();
    return ticketList.length;
  }
}