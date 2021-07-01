import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style/font.dart';

void main(){}

class ColorPicker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '남은거',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorPickerPage(title: '색상'),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  ColorPickerPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {

  void closeThisScreen() {
    Navigator.of(context, rootNavigator: true).pop(context);
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
        centerTitle: true,
      ),
    );
  }

}