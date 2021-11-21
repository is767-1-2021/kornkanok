import 'package:flutter/material.dart';
import 'package:team_app/kaew/controlllers/prize_con.dart';
import 'package:team_app/kaew/controlllers/purchase_con.dart';
import 'package:team_app/kaew/model/prize_model.dart';
import 'package:team_app/kaew/model/purchase_model.dart';
import 'package:team_app/kaew/services/prize_ser.dart';
import 'package:team_app/kaew/services/purchase_ser.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  PurHistoryServices? services;
  PurHistoryController? controller;
  List<PurHistory> purhistory = List.empty();
  // LottoCheckService? services2;
  // LottoCheckController? controller2;
  List<LottoCheck> lottocheck = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();
    services = PurHistoryServices();
    controller = PurHistoryController(services!);
    getlotto();

    getlotto();
    controller!.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void getlotto() async {
    var newpurhistory = await controller!.Fectlotto();

    setState(() {
      purhistory = newpurhistory;
    });
  }

  // void getLottoCheck() async {
  //   var newlottocheck = await controller2!.fectLottoCheck();
  //   setState(() {
  //     lottocheck = newlottocheck;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                strokeWidth: 5.0, color: Colors.purple[200]),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'ประวัติการซื้อ',
                style: TextStyle(fontSize: 28.0),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.history)),
              ],
            ),
            body: ListView.builder(
                itemCount: purhistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Icon(Icons.local_attraction_sharp),
                      title: Text(purhistory[index].lotNumPurchase),
                      tileColor: Colors.deepPurple[200 % 2],
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(purhistory[index].datePurchase),
                          Text(purhistory[index].qtyPurchase.toString() + "ใบ"),
                          Text(purhistory[index].pricePurchase.toString() +
                              "บาท"),
                        ],
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.check_box_outlined,
                            color: Colors.purple,
                          ),
                          onPressed: () {
                            if (purhistory[index].lotNumPurchase ==
                                lottocheck[index].lottoNum) {
                              showDialog(
                                context: context,
                                builder: (BuildContext Context) {
                                  return AlertDialog(
                                    title: Text('ผลการตรวจรางวัล'),
                                    content: Container(
                                      child:
                                          Text('ยินดีด้วย คุณถูกรางวัลที่1!!'),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          icon: Icon(Icons.clear_outlined))
                                    ],
                                  );
                                },
                              );
                            } else if (purhistory[index]
                                    .lotNumPurchase
                                    .substring(0, 3) ==
                                lottocheck[4].lottoNum) {
                              showDialog(
                                context: context,
                                builder: (BuildContext Context) {
                                  return AlertDialog(
                                    title: Text('ผลการตรวจรางวัล'),
                                    content: Container(
                                      child:
                                          Text('ยินดีด้วย คุณถูกเลขหน้า3ตัว!'),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          icon: Icon(Icons.clear_outlined))
                                    ],
                                  );
                                },
                              );
                            } else if (purhistory[index]
                                    .lotNumPurchase
                                    .substring(3, 6) ==
                                lottocheck[4].lottoNum) {
                              showDialog(
                                context: context,
                                builder: (BuildContext Context) {
                                  return AlertDialog(
                                    title: Text('ผลการตรวจรางวัล'),
                                    content: Container(
                                      child:
                                          Text('ยินดีด้วย คุณถูกเลขท้าย3ตัว!!'),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          icon: Icon(Icons.clear_outlined))
                                    ],
                                  );
                                },
                              );
                            } else if (purhistory[index]
                                    .lotNumPurchase
                                    .substring(4, 6) ==
                                lottocheck[4].lottoNum) {
                              showDialog(
                                context: context,
                                builder: (BuildContext Context) {
                                  return AlertDialog(
                                    title: Text('ผลการตรวจรางวัล'),
                                    content: Container(
                                      child:
                                          Text('ยินดีด้วย คุณถูกเลขท้าย2ตัว!!'),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          icon: Icon(Icons.clear_outlined))
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext Context) {
                                  return AlertDialog(
                                    title: Text('ผลการตรวจรางวัล'),
                                    content: Container(
                                      child: Text('เสียใจด้วยจ้า'),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          icon: Icon(Icons.clear_outlined))
                                    ],
                                  );
                                },
                              );
                            }
                          }));
                }),
          );
  }
}
