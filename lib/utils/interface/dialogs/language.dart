import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/l10n/localization_bloc.dart';
import '../../../config/l10n/localization_config.dart';
import '../../../modules/models/items/localization_item.dart';

class LanguagesDialog extends StatelessWidget {
  const LanguagesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return SimpleDialog(
          title: Text(AppLocalizations.of(context)!.settingsLanguagesTitle),
          backgroundColor: Theme.of(context).backgroundColor,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...[0, 1].map((int languageCode) {
                  LocalizationItem item = lookupLocalizationItem(context, languageCode);
                  return RadioListTile(
                    title: Text(item.title),
                    value: LanguageConfig.getLocalization(item.language),
                    groupValue: state.locale,
                    onChanged: (Locale? value) {
                      context.read<LocalizationBloc>().add(LocalizationChanged(language: item.language));
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
