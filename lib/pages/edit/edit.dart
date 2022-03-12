// ignore_for_file: no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final arguments;
  const EditPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState(arguments: arguments);
}

class _EditPageState extends State<EditPage> {
  var arguments;
  _EditPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑页'),
      ),
      body: Text("编辑页内容${arguments["editId"]}"),
    );
  }
}