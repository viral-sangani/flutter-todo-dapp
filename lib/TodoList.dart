import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_dapp/TodoBottomSheet.dart';
import 'package:todolist_dapp/TodoListModel.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<TodoListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dapp Todo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTodoBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      body: listModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: listModel.todos.length,
                    itemBuilder: (context, index) => ListTile(
                      title: InkWell(
                        onTap: () {
                          showTodoBottomSheet(
                            context,
                            task: listModel.todos[index],
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 12,
                          ),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: listModel.todos[index].isCompleted,
                                onChanged: (val) {
                                  listModel.toggleComplete(
                                      listModel.todos[index].id);
                                },
                              ),
                              Text(listModel.todos[index].taskName),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
