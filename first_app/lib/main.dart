import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/controllers/todo.dart';
import 'package:first_app/models/first_form_model.dart';
import 'package:first_app/pages/todo_page.dart';
import 'package:first_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/First_Page.dart';
import 'pages/eighth_page.dart';
import 'pages/fifth_page.dart';
import 'pages/forth_page.dart';
import 'pages/second_page.dart';
import 'pages/seventh_page.dart';
import 'pages/sixth_page.dart';
import 'pages/third_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = TodoController(services);

  runApp(TodoApp(controller: controller));

  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(
  //         create: (context) => FirstFormModel(),
  //       ),
  //     ],
  //     child: MyApp(),
  //   ),
  // );
}

class TodoApp extends StatelessWidget {
  final TodoController controller;
  TodoApp({required this.controller});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(
        controller: controller,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.amber,
            accentColor: Colors.amber[300],
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple))),
        initialRoute: '/5',
        routes: <String, WidgetBuilder>{
          '/1': (context) => FirstPage(),
          '/2': (context) => SecondPage(),
          '/3': (context) => ThirdPage(),
          '/4': (context) => ForthPage(),
          '/5': (context) => Fifthpage(),
          '/6': (context) => Sixthpage(),
          '/7': (context) => Seventhpage(),
          '/8': (context) => Eighthpage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 120,
  );

  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  void _incrementCounter() {
    setState(() {
      cat = cat2;
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      cat = cat1;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              margin: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 100.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(10.0)),
              child: cat,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: _decreaseCounter,
                  child: Text('Decrease'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: _incrementCounter,
                  child: Text('Increase'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.favorite),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: () {},
    );
  }
}
