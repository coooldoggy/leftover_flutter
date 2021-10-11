import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leftover_flutter/ColorPickerPage.dart';
import 'package:leftover_flutter/data/DBHelper.dart';
import 'package:leftover_flutter/data/TicketInfo.dart';

import 'style/colors.dart';
import 'style/font.dart';

class NewTicketPage extends StatefulWidget {
  const NewTicketPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTicketPage();
}

class _NewTicketPage extends State<NewTicketPage> {

  var titleStyle = TextStyle(
      color: LeftOverColor.text_greyish_brown,
      fontFamily: LeftOverTextStyle.notoSans,
      fontSize: 12);
  static var hintStyle = TextStyle(
      fontSize: 16,
      fontFamily: LeftOverTextStyle.notoSans,
      color: LeftOverColor.text_warm_grey);
  var selectedColor = LeftOverColor.use_light_aquamarine;

  static getCurrentDate() {
    return DateFormat('yyyy.MM.dd').format(DateTime.now());
  }

  static getFutureDate() {
    var now = DateTime.now().add(Duration(days: 30));
    return DateFormat('yyyy.MM.dd').format(now);
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ColorPicker(color: selectedColor)),
    );

    selectedColor = result;
    setState(() {});
    debugPrint("$result");
  }

  void selectStartDate(
      TextEditingController controller, BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      controller.text = picked.toString().substring(0, 10);
    } else {
      return null;
    }
  }

  void showMandatoryMissingDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("필수 입력 값을 입력해주세요."),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "이용권 이름, 이용권 횟수는 필수 항목입니다.",
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void registerTicket(BuildContext context) {
    if (_nameTextEditController.text.isEmpty ||
        _ticketTextEditController.text.isEmpty) {
      showMandatoryMissingDialog(context);
      return;
    }
    DBHelper().insertTicket(TicketInfo(
        id: null,
        name: _nameTextEditController.text,
        totalCnt: int.parse(_ticketTextEditController.text),
        leftCnt: null,
        color: selectedColor.value,
        startDate: _startDateTextEditController.text,
        endDate: _endDateTextEditController.text,
        location: _locationTextEditController.text,
        memo: _memoTextEditController.text));
  }

  static var _nameTextEditController = TextEditingController();
  static var _ticketTextEditController = TextEditingController();
  static var _startDateTextEditController = TextEditingController();
  static var _endDateTextEditController = TextEditingController();
  static var _locationTextEditController = TextEditingController();
  static var _memoTextEditController = TextEditingController();

  var _nameField = TextField(
    controller: _nameTextEditController,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "이용권 이름",
        counterText: "",
        hintStyle: hintStyle),
    maxLines: 1,
    maxLength: 10,
  );

  var _ticketCntField = TextField(
    controller: _ticketTextEditController,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "이용권 횟수",
        counterText: "",
        hintStyle: hintStyle),
    maxLines: 1,
    maxLength: 10,
    keyboardType: TextInputType.number,
  );

  var _locationField = TextField(
    controller: _locationTextEditController,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "장소",
        counterText: "",
        hintStyle: hintStyle),
    maxLength: 50,
    maxLines: 2,
  );

  var _memoField = TextField(
    controller: _memoTextEditController,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "메모",
        counterText: "",
        hintStyle: hintStyle),
    maxLength: 500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이용권 등록',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: LeftOverTextStyle.notoSans),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => {Navigator.pop(context)}),
        actions: [
          TextButton(
              onPressed: () => registerTicket(context),
              child: Text('등록',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: LeftOverTextStyle.notoSans)))
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
              child: _nameField,
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
                          child: _ticketCntField,
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
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedColor,
                          ),
                          margin: EdgeInsets.only(top: 25, bottom: 10),
                          child: IconButton(
                              icon: Icon(Icons.check, color: Colors.transparent),
                              onPressed: () =>
                                  _navigateAndDisplaySelection(context)),
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
                            controller: _startDateTextEditController,
                            readOnly: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "${getCurrentDate()}",
                                counterText: "",
                                hintStyle: hintStyle),
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            onTap: () => selectStartDate(
                                _startDateTextEditController, context),
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
                            controller: _endDateTextEditController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "${getFutureDate()}",
                                counterText: "",
                                hintStyle: hintStyle),
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            onTap: () => selectStartDate(
                                _endDateTextEditController, context),
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
              child: _locationField,
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
              child: _memoField,
            ),
          ],
        ),
      ),
    );
  }
}

