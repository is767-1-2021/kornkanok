import 'package:cloud_firestore/cloud_firestore.dart';

class Historylist {
  final String howto;
  final String answer;

  Historylist(this.howto, this.answer);

  factory Historylist.fromJson(
    Map<String, dynamic> json,
  ) {
    return Historylist(
      json['howto'] as String,
      json['answer'] as String,
    );
  }
}

class AllHistorylist {
  final List<Historylist> historylist;
  AllHistorylist(this.historylist);

  factory AllHistorylist.fromJson(List<dynamic> json) {
    List<Historylist> historylist;

    historylist = json.map((index) => Historylist.fromJson(index)).toList();
    return AllHistorylist(historylist);
  }

  factory AllHistorylist.fromSnapshot(QuerySnapshot s) {
    List<Historylist> historylist = s.docs.map((DocumentSnapshot ds) {
      return Historylist.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllHistorylist(historylist);
  }
}
