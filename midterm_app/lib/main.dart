import 'package:flutter/material.dart';
import 'package:midterm_app/Blank.dart';
import 'package:midterm_app/Changeuser.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/model/UsernameForm.dart';

import 'Account.dart';
import 'History.dart';
import 'Homie.dart';
import 'Changeuser.dart';
import 'Blank.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsernameFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Millionaire',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.deepPurple[50],
            primarySwatch: Colors.purple,
            appBarTheme: AppBarTheme(
              color: Colors.deepPurple[200],
            ),
            bottomAppBarColor: Colors.deepPurple[200]),
        initialRoute: '/hom',
        routes: <String, WidgetBuilder>{
          '/acc': (context) => Account(),
          '/his': (context) => History(),
          '/use': (context) => Changeuser(),
          '/hom': (context) => Homie(),
          '/bla': (context) => Blank(),
          '/ren': (context) => Changeuser(),
        });
  }
}
