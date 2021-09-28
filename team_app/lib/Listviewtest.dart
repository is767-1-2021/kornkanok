import 'package:flutter/material.dart';

class Item {
  String headerValue;
  String number;

  Item({required this.headerValue, required this.number});
}

final List<Item> _item = <Item>[
  Item(headerValue: 'งวดวันที่ 16 กันยายน 2564', number: '145621'),
  Item(headerValue: 'งวดวันที่ 16 กันยายน 2564', number: '123435'),
  Item(headerValue: 'งวดวันที่ 16 กันยายน 2564', number: '346434')
];

class Listviewtest extends StatefulWidget {
  @override
  _ListviewtestState createState() => _ListviewtestState();
}

class _ListviewtestState extends State<Listviewtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ประวัติการซื้อ',
            style: TextStyle(fontSize: 34.0),
          ),
        ),
        body: ListView.separated(
            itemCount: _item.length,
            itemBuilder: (BuildContext context, int index) {
              Item item = _item[index];
              return ListTile(
                title: Text(
                  item.headerValue,
                ),
                subtitle: Text(item.number),
                tileColor: Colors.deepPurple[100],
              );
            },
            separatorBuilder: (context, index) => Divider()));
  }
}
