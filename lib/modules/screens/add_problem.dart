import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProblemScreen extends StatelessWidget {
  const AddProblemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeNewProblemTitle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add-problem-tag',
        mini: true,
        child: const Icon(Icons.add),
        onPressed: () {
          Fluttertoast.showToast(msg: 'Added');
        },
      ),
    );
  }
}
