import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => null),
        actions: [
          TextButton(
              onPressed: () => null,
              child: Text('등록', style: TextStyle(color: Colors.black)))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
