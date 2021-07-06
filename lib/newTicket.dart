import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:leftover_flutter/ColorPicker.dart';
import 'style/font.dart';
import 'style/colors.dart';

void main() {}

class NewTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '남은거',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewTicketPage(title: '이용권 등록'),
    );
  }
}

class NewTicketPage extends StatefulWidget {
  NewTicketPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NewTicketPageState createState() => _NewTicketPageState();
}

class _NewTicketPageState extends State<NewTicketPage> {
  var titleStyle = TextStyle(color: LeftOverColor.text_greyish_brown, fontFamily: LeftOverTextStyle.notoSans,  fontSize: 12);
  var hintStyle = TextStyle(fontSize: 16, fontFamily: LeftOverTextStyle.notoSans, color: LeftOverColor.text_warm_grey);

  getCurrentDate() {
    return DateFormat('yyyy.MM.dd').format(DateTime.now());
  }

  getFutureDate() {
    var now = DateTime.now().add(Duration(days: 30));
    return DateFormat('yyyy.MM.dd').format(now);
  }

  void closeThisScreen() {
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  void openColorPickerScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ColorPicker()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: LeftOverTextStyle.notoSans),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => closeThisScreen()),
        actions: [
          TextButton(
              onPressed: () => null,
              child: Text('등록', style: TextStyle(color: Colors.black, fontFamily: LeftOverTextStyle.notoSans)))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 16, left: 22),
              child: Text("이용권 이름", style: titleStyle),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 9, left: 22),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "이용권 이름",
                    counterText: "",
                    hintStyle: hintStyle),
                maxLines: 1,
                maxLength: 10,
              ),
            ),
            Divider(
              height: 1,
              color: LeftOverColor.very_light_pink,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 16, left: 22),
                          child: Text("이용권 횟수", style: titleStyle),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 9, left: 22),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "이용권 횟수",
                                counterText: "",
                                hintStyle: hintStyle),
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: LeftOverColor.very_light_pink,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 16, left: 22),
                          child: Text("색상", style: titleStyle),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 9, left: 10),
                          child: IconButton(
                              icon: Image.asset('assets/resources/color-01.png'),
                              onPressed: () => openColorPickerScreen()),
                        ),
                        Divider(
                          height: 1,
                          color: LeftOverColor.very_light_pink,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 16, left: 22),
                          child: Text("시작일", style: titleStyle),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 9, left: 22),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "${getCurrentDate()}",
                                counterText: "",
                                hintStyle: hintStyle),
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: LeftOverColor.very_light_pink,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 16, left: 22),
                          child: Text("종료일", style: titleStyle),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 9, left: 22),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "${getFutureDate()}",
                                counterText: "",
                                hintStyle: hintStyle),
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: LeftOverColor.very_light_pink,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 16, left: 22),
              child: Text("장소", style: titleStyle),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 9, left: 22),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "장소",
                    counterText: "",
                    hintStyle: hintStyle),
                maxLength: 50,
                maxLines: 2,
              ),
            ),
            Divider(
              height: 1,
              color: LeftOverColor.very_light_pink,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 16, left: 22),
              child: Text("메모", style: titleStyle),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 9, left: 22),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "메모",
                    counterText: "",
                    hintStyle: hintStyle),
                maxLength: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
