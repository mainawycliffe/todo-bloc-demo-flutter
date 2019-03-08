import 'package:flutter/material.dart';
import 'package:todo_bloc_demo_flutter/_todo.dart';

class AddTodo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TodoForm(),
    );
  }
}

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _frmAddTodo = GlobalKey<FormState>();

  final _todo = new TextEditingController();
  final _description = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: _gradient(),
      ),
      // color: Color(0xFFFFF3E0),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _frmAddTodo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTitleText(context),
              SizedBox(height: 25),
              _buildTodoTextfield(),
              SizedBox(height: 15),
              _buildDescriptionField(),
              SizedBox(height: 15),
              buildBtnGroup(context)
            ],
          ),
        ),
      ),
    );
  }

  Row buildBtnGroup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(child: _buildAddBtn()),
        SizedBox(
          width: 10,
        ),
        Expanded(child: _buildCancelButton(context)),
      ],
    );
  }

  Align buildTitleText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Add a new To-Do",
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  RaisedButton _buildAddBtn() {
    return RaisedButton(
      onPressed: _saveTodo,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(Icons.save),
            SizedBox(
              width: 5,
            ),
            Text("Add to do")
          ],
        ),
      ),
    );
  }

  RaisedButton _buildCancelButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pop(context, null);
      },
      color: Theme.of(context).errorColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(Icons.cancel),
            SizedBox(width: 5),
            Text("Cancel")
          ],
        ),
      ),
    );
  }

  TextFormField _buildDescriptionField() {
    return TextFormField(
      controller: _description,
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: "Description",
      ),
    );
  }

  TextFormField _buildTodoTextfield() {
    return TextFormField(
      controller: _todo,
      autofocus: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'This field is required!';
        }
      },
      decoration: InputDecoration(
        labelText: "To do",
      ),
    );
  }

  LinearGradient _gradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFFF3E0),
        Color(0xFFFFE0B2),
        Color(0xFFFFCC80),
      ],
      stops: [0.3, 0.5, 0.8],
    );
  }

  // save action
  _saveTodo() {
    if (_frmAddTodo.currentState.validate()) {
      // send back to previous list
      TodoItem todo = TodoItem(
        todo: _todo.value.text,
        description: _description.value.text,
        done: false,
      );
      Navigator.pop(context, todo);
    }
  }
}
