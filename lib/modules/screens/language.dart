import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/l10n/localization_bloc.dart';
import '../../config/l10n/localization_config.dart';
import '../models/models.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settingsLanguagesTitle)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Text(
              AppLocalizations.of(context)!.settingsLanguagesDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
              return Material(
                color: Theme.of(context).canvasColor,
                child: Column(
                  children: Language.values.map((Language language) {
                    LocalizationItem item = lookupLocalizationItem(context, language);
                    return RadioListTile(
                      title: Text(item.title),
                      value: LanguageConfig.getLocalization(item.language),
                      groupValue: state.locale,
                      onChanged: (Locale? value) {
                        context.read<LocalizationBloc>().add(LocalizationChanged(language: language));
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
