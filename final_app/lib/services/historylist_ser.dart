import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/historylist.dart';

abstract class Services {
  Future<List<Historylist>> gethistory();
}

class HistorylistServices extends Services {
  @override
  Future<List<Historylist>> gethistory() async {
    QuerySnapshot snapshot = // read DB
        await FirebaseFirestore.instance.collection('cal_history').get();

    AllHistorylist historylist = AllHistorylist.fromSnapshot(snapshot);
    return historylist.historylist;
  }
}
