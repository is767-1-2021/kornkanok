import 'dart:async';
import 'package:final_app/models/historylist.dart';
import 'package:final_app/services/historylist_ser.dart';

class HistorylistController {
  final Services service;
  List<Historylist> historylist = List.empty();

  StreamController<bool> onSyncController =
      StreamController(); // checking status stream onsync (on process / finish)
  Stream<bool> get onSync => onSyncController.stream;

  HistorylistController(this.service);

  Future<List<Historylist>> Fecthistory() async {
    onSyncController.add(true); // stream connected
    historylist = await service.gethistory();
    onSyncController.add(false); // stop connected
    return historylist;
  }
}
