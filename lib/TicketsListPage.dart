import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/style/font.dart';

class TicketListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text(
          '이용권',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: LeftOverTextStyle.notoSans),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => {
              Navigator.pop(context)
            }),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: '사용중',),
            Tab(text: '사용완료',)
          ],
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: LeftOverTextStyle.notoSans),
        ),
      ),
      body: TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
        ],
      ),
    ));
  }
}
