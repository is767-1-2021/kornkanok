import 'package:final_app/calculator.dart';
import 'package:final_app/history.dart';
import 'package:final_app/models/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Historyprovider(),
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
        title: 'Calculator',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey[800],
          appBarTheme: AppBarTheme(
            color: Colors.blueGrey[900],
          ),
        ),
        initialRoute: '/cal',
        routes: <String, WidgetBuilder>{
          '/cal': (context) => Calculator(),
          '/his': (context) => History(),
        });
  }
}
