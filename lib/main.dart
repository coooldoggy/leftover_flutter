import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leftover_flutter/MainPage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'ColorPickerPage.dart';
import 'package:provider/provider.dart';
import 'style/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorListTile>(
      create: (context) => ColorListTile(),
      child: MaterialApp(
        title: '남은거',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ko', 'KO'),
        ],
      ),
    );
  }
}

