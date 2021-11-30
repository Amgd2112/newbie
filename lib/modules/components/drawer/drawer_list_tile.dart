import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/routes/routes_bloc.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String destination;
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.destination,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        context.read<RoutesBloc>().add(DestinationChanged(destination: destination));
        Navigator.pop(context);
      },
    );
  }
}
