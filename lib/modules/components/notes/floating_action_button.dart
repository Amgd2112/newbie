import 'package:flutter/material.dart';

class NotesFloatingActionButton extends StatelessWidget {
  const NotesFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.note_add),
    );
  }
}
