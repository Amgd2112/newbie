import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/theme/theme_bloc.dart';
import '../../config/theme/theme_config.dart';
import '../models/items/theme_item.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settingsThemeTitle)),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Text(
              AppLocalizations.of(context)!.settingsThemeDescription,
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
                    ThemeItem item = lookupThemeItem(context, key);
                    return RadioListTile(
                      title: Text(item.title),
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
