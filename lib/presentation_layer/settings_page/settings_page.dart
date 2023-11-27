import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/settings_bloc/settings.dart';
import 'package:todo_test_app/presentation_layer/settings_page/widgets/setting_body_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              SettingBodyWidget(
                title: locale.theme,
                items: [locale.light, locale.dark],
                selectedVariant:
                    state.currentTheme == 'light' ? locale.light : locale.dark,
                onSelected: (value) => context.read<SettingsBloc>().add(
                      ThemeSelected(
                        theme: value == locale.light ? 'light' : 'dark',
                      ),
                    ),
              ),
              const Divider(),
              SettingBodyWidget(
                title: locale.language,
                items: [locale.russian, locale.english],
                selectedVariant: state.currentLanguage == 'russian'
                    ? locale.russian
                    : locale.english,
                onSelected: (value) => context.read<SettingsBloc>().add(
                      LanguageSelected(
                        language:
                            value == locale.russian ? 'russian' : 'english',
                      ),
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
