import 'package:final_app/controllers/historylist_con.dart';
import 'package:final_app/models/historylist.dart';
import 'package:final_app/models/provider.dart';
import 'package:final_app/services/historylist_ser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HistorylistServices? services;
  HistorylistController? controller;
  List<Historylist> historylist = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();
    services = HistorylistServices();
    controller = HistorylistController(services!);

    gethistory();
    controller!.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void gethistory() async {
    var newhistorylist = await controller!.Fecthistory();

    setState(() {
      historylist = newhistorylist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                strokeWidth: 5.0, color: Colors.blueGrey[50]),
          )
        : Scaffold(
            appBar: AppBar(title: Text("History")),
            body: Consumer<Historyprovider>(builder: (context, show, child) {
              return ListView.separated(
                  itemCount: historylist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        title: Text(
                          // show.inputFull[index] +
                          //     show.operator[index] +
                          //     show.answerTemp[index] +
                          //     "=",
                          historylist[index].howto + "=",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        subtitle: Text(
                          // show.answer[index],
                          historylist[index].answer,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.right,
                        ));
                  },
                  separatorBuilder: (context, index) => Divider());
            }),
          );
  }
}
