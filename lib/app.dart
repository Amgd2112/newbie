import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'blocs/blocs.dart';
import 'config/theme/theme_config.dart';
import 'modules/screens/screens.dart';

class NewbieApp extends StatelessWidget {
  const NewbieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (localizationContext, localizationState) {
            return MaterialApp(
              title: 'Newbie',
              debugShowCheckedModeBanner: false,

              theme: ThemeConfig.light,
              darkTheme: ThemeConfig.dark,
              themeMode: themeState.mode,

              locale: localizationState.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
                return locale;
              },
        
              home: BlocBuilder<NetworkBloc, NetworkState>(
                builder: (networkContext, networkState) {
                  if (networkState is ConnectionInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (networkState is ConnectionChanged) {
                    return const InternetConnectionScreen();
                  }

                  return BlocBuilder<NavigationBloc, NavigationState>(
                    builder: (context, state) {
                      return const WrapperScreen();
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
