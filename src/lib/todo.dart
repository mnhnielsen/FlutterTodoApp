import 'package:flutter/material.dart';

void main() => runApp(ListTodoApp());

class ListTodoApp extends StatefulWidget {
  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodoApp> {
  final List<String> entries = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: entries.length > 0
            ? ListView.separated(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${entries[index]}'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.black,
                ),
              )
            : Center(
                child: Text(
                    'No Todos. Write in the top bar and add it on the plus icon'),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              entries.add(textController.text);
              textController.clear();
            });
          },
        ),
      ),
    );
  }
}
