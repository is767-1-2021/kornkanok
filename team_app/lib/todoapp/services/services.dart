import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:team_app/todoapp/models/todo.dart';

abstract class Services {
  Future<List<Todo>> getTodos();

  Future<void> updateTodos(int id, bool completed);
}

class FirebaseServices extends Services {
  @override
  Future<List<Todo>> getTodos() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('todos').get();

    AllTodos todos = AllTodos.fromSnapshot(snapshot);
    return todos.todos;
  }

  CollectionReference todos = FirebaseFirestore.instance.collection('todos');

  Future<void> updateTodos(int _id, bool _completed) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .where('id', isEqualTo: _id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        todos.doc(doc.id).update({'completed': _completed});
      });
    });
  }
}

@override
Future<void> updateTodos(int id, bool completed) {
  throw UnimplementedError();
}
