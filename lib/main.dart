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
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              buttonColor: ITEM_BACKGROUND_DARK,
              hoverColor: ITEM_BACKGROUND,
              highlightColor: ITEM_BACKGROUND,
              textTheme: ButtonTextTheme.accent,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    secondary: Colors.white,
                  ), // T
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
        cardColor: ITEM_BACKGROUND,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline4: Theme.of(context).textTheme.headline4.copyWith(
                    color: PRIMARY_TEXT,
                    fontFamily: "Akzidenz-Grotesk",
                  ),
              headline5: Theme.of(context).textTheme.headline5.copyWith(
                    color: PRIMARY_TEXT,
                    fontFamily: "Akzidenz-Grotesk",
                  ),
              headline6: Theme.of(context).textTheme.headline6.copyWith(
                    color: PRIMARY_TEXT,
                    fontFamily: "Akzidenz-Grotesk",
                  ),
            ),
      ),
      home: Home(title: APP_TITLE),
    );
  }
}
