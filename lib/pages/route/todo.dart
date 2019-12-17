import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

///不作为一个页面单独运行时，该main方法不会触发,所以在这里构建list数据，不会传递到TodoPage中，导致报错
void main() {
  runApp(new MaterialApp(
    title: "清单列表",
    theme: ThemeData(primaryColor: Colors.amberAccent),
//    home: TodoPage(
//      todos: List.generate(
//          20, (i) => Todo('Todo $i', 'A description  for Todo $i')),
//    ),
  ));
}

///Todo列表页
class TodoPage extends StatelessWidget {
  final List<Todo> todos =
      List.generate(20, (i) => Todo('Todo $i', 'A description  for Todo $i'));

  ///这样声明key，可以在传参时，写法上和flutter统一，更清晰
//  TodoPage({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Todo列表"),
      ),
      body: ListView.builder(

          ///类似getItemCount
          itemCount: todos.length,

          ///类似getView
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                ///点击查看详情页
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoDescriptionPage(
                            todo: Todo(todos[index].title,
                                todos[index].description))));
              },
            );
          }),
    );
  }
}

///Todo详情页
class TodoDescriptionPage extends StatelessWidget {
  final Todo todo;

  TodoDescriptionPage({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(todo.title+" 的详情页"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("这是从Todo列表中传递过来的详情信息\n"+todo.description),
      ),
    );
  }
}
