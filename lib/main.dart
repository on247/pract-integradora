import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        cardColor: ITEM_BACKGROUND,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline4: Theme.of(context).textTheme.headline4.copyWith(
                    color: PRIMARY_TEXT,
                  ),
              headline5: Theme.of(context).textTheme.headline5.copyWith(
                    color: ITEM_TEXT,
                  ),
            ),
      ),
      home: Home(title: APP_TITLE),
    );
  }
}
