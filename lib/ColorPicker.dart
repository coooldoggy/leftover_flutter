import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/style/colors.dart';
import 'style/font.dart';

void main() {}

class ColorPicker extends StatelessWidget {
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

  List<Color> colorList = [
    LeftOverColor.use_light_aquamarine,
    LeftOverColor.use_manila,
    LeftOverColor.use_pastel_purple,
    LeftOverColor.use_sun_yellow,
    LeftOverColor.use_pale_salmon,
    LeftOverColor.use_light_blue,
    LeftOverColor.use_pale_orange
  ];

  List<Container> _buildColorGridList() => List.generate(
      7,
      (index) => Container(
            width: 45,
            height: 45,
            child: Icon(Icons.check, color: Colors.white),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorList[index],
          )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
            onPressed: () => closeThisScreen()),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: GridView.count(
            crossAxisCount: 5,
            childAspectRatio: 3/2,
            padding: EdgeInsets.fromLTRB(35, 33, 21, 22),
            children: _buildColorGridList()
          ),
        ),
      ),
    );
  }
}