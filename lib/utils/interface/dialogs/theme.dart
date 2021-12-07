import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/theme/theme_bloc.dart';
import '../../../config/theme/theme_config.dart';
import '../../../modules/models/items/theme_item.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SimpleDialog(
          title: Text(AppLocalizations.of(context)!.settingsThemeTitle),
          backgroundColor: Theme.of(context).backgroundColor,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...[1, 2, 0].map((int key) {
                  ThemeItem item = lookupThemeItem(context, key);
                  return RadioListTile(
                    title: Text(item.title),
                    value: item.mode,
                    groupValue: state.mode,
                    onChanged: (ThemeMode? value) {
                      context.read<ThemeBloc>().add(ThemeChanged(key: key));
                    },
                    activeColor: Theme.of(context).primaryColor,
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "cancel".toUpperCase(),
                      style: Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
