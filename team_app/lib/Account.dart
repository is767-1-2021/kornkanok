import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/model/UsernameForm.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'บัญชีของฉัน',
          style: TextStyle(
            fontSize: 34.0,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.account_circle_rounded)),
        ],
      ),
      body: Column(children: <Widget>[
        Container(
          height: 150.0,
          padding: EdgeInsets.all(8.0),
          color: Colors.deepPurple[100],
          child: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(1000.0)),
                child: Image.asset(
                  'asset/Alif.jpg',
                )),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 10.0, top: 30.0),
                  child: Consumer<UsernameFormModel>(
                      builder: (context, form, child) {
                    return Text(
                      '${form.Username}',
                      style: TextStyle(
                          fontSize: 45.0, fontWeight: (FontWeight.w300)),
                    );
                  })),
              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    child: const Text(
                      'แก้ไข username',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/use');
                    },
                  ))
            ])
          ]),
        ),
        Expanded(
          child: ListView(shrinkWrap: true, children: [
            ListTile(
              tileColor: Colors.purple[50],
              title: Text(
                'แก้ไขข้อมูลส่วนตัว',
                style: TextStyle(
                  fontSize: 38.0,
                ),
              ),
              leading: Icon(Icons.mode_edit),
            ),
            ListTile(
              tileColor: Colors.purple[50],
              title: Text(
                'กระเป๋าเงิน',
                style: TextStyle(
                  fontSize: 38.0,
                ),
              ),
              leading: Icon(Icons.local_atm),
            ),
            ListTile(
                tileColor: Colors.purple[50],
                title: Text(
                  'ประวัติการซื้อ',
                  style: TextStyle(
                    fontSize: 38.0,
                  ),
                ),
                leading: Icon(Icons.history),
                onTap: () {
                  Navigator.pushNamed(context, '/his');
                }),
            ListTile(
              tileColor: Colors.purple[50],
              title: Text(
                'ตั้งค่า',
                style: TextStyle(
                  fontSize: 38.0,
                ),
              ),
              leading: Icon(Icons.settings),
            ),
            ListTile(
                tileColor: Colors.purple[50],
                title: Text(
                  'ช่องทางการติดต่อ',
                  style: TextStyle(
                    fontSize: 38.0,
                  ),
                ),
                leading: Icon(
                  Icons.place,
                ))
          ]),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'ตรวจรางวัล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'การแจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'บัญชีของฉัน',
          ),
        ],
        currentIndex: 4,
      ),
    );
  }
}
