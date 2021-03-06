import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leftover_flutter/style/colors.dart';
import 'package:leftover_flutter/style/font.dart';
import 'package:provider/provider.dart';

import '../data/ColorData.dart';
import '../data/ColorListTile.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({Key? key, required this.color}) : super(key: key);
  final postRefresh = ChangeNotifier();
  final Color color;

  @override
  State<StatefulWidget> createState() => _ColorPicker();
}

class _ColorPicker extends State<ColorPicker> {
  var resultCode = LeftOverColor.use_light_aquamarine;
  var resultIdx = -1;

  List<ColorData> colorDataList = [
    ColorData(LeftOverColor.use_light_aquamarine, false),
    ColorData(LeftOverColor.use_manila, false),
    ColorData(LeftOverColor.use_pastel_purple, false),
    ColorData(LeftOverColor.use_sun_yellow, false),
    ColorData(LeftOverColor.use_pale_salmon, false),
    ColorData(LeftOverColor.use_light_blue, false),
    ColorData(LeftOverColor.use_pale_orange, false)
  ];

  @override
  void initState() {
    resultCode = widget.color;
    setInitColorList();
  }

  void setInitColorList(){
    var list = Provider.of<ColorListTile>(context, listen: false);
    colorDataList.asMap().forEach((index, value) {
      if(value.colorCode == widget.color){
        colorDataList[index].selected = true;
        resultIdx = index;
        list.refresh();
        return;
      }
    });
  }

  void setResultColor(ColorData pickedColor, int index, BuildContext context){
    var list = Provider.of<ColorListTile>(context, listen: false);
    resultCode = pickedColor.colorCode;
    if(resultIdx != -1){
      colorDataList[resultIdx].selected = false;
    }
    resultIdx = index;
    colorDataList[index].selected = true;
    list.refresh();
  }

  List<Container> _buildColorGridList(BuildContext context) {
    var colorList = Provider.of<ColorListTile>(context);
    var list = List.generate(
        7,
            (index) => Container(
            width: 45,
            height: 45,
            child: IconButton(
                icon: Icon(Icons.check, color: colorDataList[index].selected ? Colors.white : Colors.transparent),
                onPressed: () => setResultColor(colorDataList[index], index, context)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorDataList[index].colorCode,
            )));
    list.forEach((element) {
      colorList.add(element);
    });

    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '??????',
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
              onPressed: () => {
                Navigator.pop(context, resultCode)
              }),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: GridView.count(
              crossAxisCount: 5,
              childAspectRatio: 3/2,
              padding: EdgeInsets.fromLTRB(35, 33, 21, 35),
              mainAxisSpacing: 20,
              children:_buildColorGridList(context),
            ),
          ),
        ));
  }
}
