import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'newTicket.dart';
import 'style/colors.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '남은거',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '남은거'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void goToNewTicket(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewTicket()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: SvgPicture.asset('assets/resources/iconhand.svg'),
            onPressed: () => null),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Image.asset('assets/resources/icon-ticket.png'))
        ],
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              availableCalendarFormats: const {
                CalendarFormat.month: '월',
                CalendarFormat.week: '주',
              },
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              locale: 'ko_kr',
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.center,
                    child: Text(
              '등록된 정보가 없습니다.',
              style: TextStyle(color: Colors.grey),
            )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToNewTicket,
        tooltip: 'Add',
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: LeftOverColor.logo_purpley,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
