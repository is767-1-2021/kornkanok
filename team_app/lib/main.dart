import 'package:flutter/material.dart';
import 'package:team_app/Changeuser.dart';
import 'package:provider/provider.dart';
import 'package:team_app/Listviewtest.dart';
import 'package:team_app/model/UsernameForm.dart';

import 'Account.dart';
import 'History.dart';
import 'Listviewtest.dart';

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
            fontFamily: 'JasmineUPC',
            bottomAppBarColor: Colors.deepPurple[200]),
        initialRoute: '/acc',
        routes: <String, WidgetBuilder>{
          '/acc': (context) => Account(),
          '/his': (context) => History(),
          '/use': (context) => Changeuser(),
          '/list': (context) => Listviewtest(),
        });
  }
}
