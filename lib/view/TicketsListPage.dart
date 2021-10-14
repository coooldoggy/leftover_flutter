import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/style/font.dart';

import 'UsingTicketPage.dart';

class TicketListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TicketListPage();
}

class _TicketListPage extends State<TicketListPage> with SingleTickerProviderStateMixin{
  static const List<Tab> ticketTabs = <Tab> [
    Tab(text: '사용중',),
    Tab(text: '사용완료',)
  ];

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: ticketTabs.length, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          tabs: ticketTabs,
          controller: _tabController,
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
        controller: _tabController,
        children: [
          UsingTicketPage(),
          Icon(Icons.directions_transit),
        ],
      ),
    );
  }
}
