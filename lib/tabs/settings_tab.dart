import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/show_language_bottom_sheet.dart';
import '../bottom_sheets/show_theme_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: pro.theme == ThemeMode.light
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.onSecondary)),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Text(
                  pro.local == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.theme == ThemeMode.light
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onSecondary)),
            ),
          ),
          SizedBox(height: 18),
          Text(AppLocalizations.of(context)!.mode,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: pro.theme == ThemeMode.light
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.onSecondary)),
          InkWell(
            onTap: () {
              showThemingBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Text(
                  pro.theme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.theme == ThemeMode.light
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onSecondary)),
            ),
          ),
        ],
      ),
    );
  }

  //use shape: that is in bottom sheet instead of decoration: in Container
  //(BuildContext context) using it while StatlessWidget
  void showLanguageBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  //use StatefulWidget make the context shared with the whole file so no need to add context in the parameters
  void showThemingBottomSheet() {
    showBottomSheet(
      context: context,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      builder: (context) {
        return ThemingBottomSheet();
      },
    );
  }
}
