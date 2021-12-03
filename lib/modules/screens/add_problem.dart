import 'package:flutter/material.dart';

class AddProblemScreen extends StatelessWidget {
  const AddProblemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Problem'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
          ),
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Expanded(
            child: Container(color: Colors.purple),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: const FloatingActionButton(
        heroTag: 'add-problem-tag',
        tooltip: 'Add',
        elevation: 0.0,
        mini: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: null,
      ),
    );
  }
}
