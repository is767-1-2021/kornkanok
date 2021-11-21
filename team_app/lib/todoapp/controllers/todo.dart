import 'dart:async';

import 'package:team_app/todoapp/models/todo.dart';
import 'package:team_app/todoapp/services/services.dart';

class TodoController {
  final FirebaseServices services;
  List<Todo> todos = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.services);

  Future<List<Todo>> fectTodos() async {
    onSyncController.add(true);
    todos = await services.getTodos();
    onSyncController.add(false);
    return todos;
  }

  void updateTodo(int _id, bool _completed) {
    services.updateTodos(_id, _completed);
  }
}
