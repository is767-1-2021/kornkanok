import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.amber,
            accentColor: Colors.red,
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple))),
        initialRoute: '/forth',
        routes: <String, WidgetBuilder>{
          '/first': (context) => FirstPage(),
          '/second': (context) => SecondPage(),
          '/third': (context) => ThirdPage(),
          '/forth': (context) => ForthPage()
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

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bus_alert)),
          IconButton(onPressed: () {}, icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SecondPage'), centerTitle: true),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.build_circle_sharp),
          onPressed: () {},
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Here is the table'),
            Table(children: [
              TableRow(children: [
                Container(
                    child: Center(child: Text('No')),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0))),
                Container(
                    child: Center(child: Text('Name')),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0))),
                Container(
                    child: Center(child: Text('Gender')),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0)))
              ]),
              TableRow(children: [
                Center(child: Text('1')),
                Center(child: Text('KS')),
                Center(child: Text('Female'))
              ]),
              TableRow(children: [
                Center(child: Text('2')),
                Center(child: Text('NV')),
                Center(child: Text('Female'))
              ])
            ])
          ],
        )));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 2,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text('ThirdPage'),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.cloud),
                ),
                Tab(
                  icon: Icon(Icons.beach_access),
                ),
                Tab(
                  icon: Icon(Icons.brightness_1_outlined),
                )
              ])),
          body: TabBarView(
            children: [
              Center(
                child: Text('Cloud'),
              ),
              Center(
                child: Text('Umbrella'),
              ),
              Center(
                child: Text('Sunny'),
              )
            ],
          ),
        ));
  }
}

class ForthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N'
    ];
    final List<int> colorCodes = <int>[600, 400, 100];
    return Scaffold(
        appBar: AppBar(title: Text('Listview Example')),
        body: ListView.separated(
            padding: EdgeInsets.all(8.0),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 100,
                  color: Colors.amber[colorCodes[index % 3]],
                  child: Center(child: Text('Entry ${entries[index]}')));
            },
            separatorBuilder: (context, index) => Divider()));
  }
}