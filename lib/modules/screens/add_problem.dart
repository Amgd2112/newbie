import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProblemScreen extends StatelessWidget {
  const AddProblemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Problem'),
      ),
      body: Column(
        children: const [],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add-problem-tag',
        tooltip: 'Add',
        elevation: 0.0,
        mini: true,
        child: const Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: () {
          Fluttertoast.showToast(msg: 'Added');
        },
      ),
    );
  }
}
