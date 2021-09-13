import 'package:flutter/material.dart';

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
