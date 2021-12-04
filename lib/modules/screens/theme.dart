import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/theme/theme_bloc.dart';
import '../../config/theme/theme_config.dart';
import '../modules.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Settings')),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Text(
              'Select your default theme setting.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Material(
                color: Theme.of(context).canvasColor,
                child: Column(
                  children: [0, 1, 2].map((int key) {
                    ThemeItem item = ThemeConfig.getThemeItem(key);
                    return RadioListTile(
                      title: Text(item.title),
                      subtitle: Text(item.subtitle),
                      value: item.mode,
                      groupValue: state.mode,
                      onChanged: (ThemeMode? value) {
                        context.read<ThemeBloc>().add(ThemeChanged(key: key));
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
