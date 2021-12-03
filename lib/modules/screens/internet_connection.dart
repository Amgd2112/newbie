import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnectionScreen extends StatelessWidget {
  const InternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Internet Connection'),
      ),
    );
  }
}
