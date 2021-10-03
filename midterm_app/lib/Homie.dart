import 'package:flutter/material.dart';

class Homie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Millionaire'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        ],
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/acc');
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 50.0,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/his');
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      size: 50.0,
                    ),
                    Text(
                      'Purchase History',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/bla');
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_active,
                      size: 50.0,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/bla');
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 50.0,
                    ),
                    Text(
                      'Shopping Cart',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/bla');
              },
              focusColor: Colors.deepPurple[200],
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.money,
                      size: 50.0,
                    ),
                    Text(
                      'Check',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/bla');
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_graph,
                      size: 50.0,
                    ),
                    Text(
                      'Statistics',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ]),
    );
  }
}
