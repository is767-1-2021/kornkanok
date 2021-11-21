import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/todoapp/controllers/todo.dart';
import 'package:team_app/todoapp/models/todo.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  TodoPage({required this.controller});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fectTodos();

    setState(() {
      todos = newTodos;
    });
  }

  void _updateTodos(int _id, bool _completed) {
    widget.controller.updateTodo(_id, _completed);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text('Tap button to fetch to Todos');
            }
            return CheckboxListTile(
              value: todos[index].completed,
              title: Text(todos[index].title),
              onChanged: (bool? value) {
                setState(() {
                  todos[index].completed = value!;
                  _updateTodos(todos[index].id, value);
                });
              },
            );
          },
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }
}
