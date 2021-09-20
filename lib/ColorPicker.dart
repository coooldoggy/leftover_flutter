import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/data/ColorData.dart';
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
    Navigator.of(context, rootNavigator: true).pop(resultCode);
  }

  List<ColorData> colorDataList = [
    ColorData(LeftOverColor.use_light_aquamarine, false),
    ColorData(LeftOverColor.use_manila, false),
    ColorData(LeftOverColor.use_pastel_purple, false),
    ColorData(LeftOverColor.use_sun_yellow, false),
    ColorData(LeftOverColor.use_pale_salmon, false),
    ColorData(LeftOverColor.use_light_blue, false),
    ColorData(LeftOverColor.use_pale_orange, false)
  ];

  var resultCode = LeftOverColor.use_light_aquamarine;
  var resultIdx = -1;
  void setResultColor(ColorData pickedColor, int index){
    resultCode = pickedColor.colorCode;
    if(resultIdx != -1){
      colorDataList[resultIdx].selected = false;
    }
    resultIdx = index;
    colorDataList[index].selected = true;
    setState(() {});
  }

  List<Container> _buildColorGridList() => List.generate(
      7,
      (index) => Container(
            width: 45,
            height: 45,
            child: IconButton(
                icon: Icon(Icons.check, color: colorDataList[index].selected ? Colors.white : Colors.transparent),
                onPressed: () => setResultColor(colorDataList[index], index)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorDataList[index].colorCode,
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
            padding: EdgeInsets.fromLTRB(35, 33, 21, 35),
            mainAxisSpacing: 20,
            children: _buildColorGridList()
          ),
        ),
      ),
    );
  }
}