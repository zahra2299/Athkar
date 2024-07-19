import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context); //close sheet after selection
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.theme == ThemeMode.light
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onPrimary)),
                provider.theme == ThemeMode.light
                    ? Icon(Icons.done,
                        size: 30, color: MyThemeData.primaryColor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.theme == ThemeMode.dark
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.surface)),
                provider.theme == ThemeMode.dark
                    ? Icon(Icons.done,
                        size: 30, color: MyThemeData.primaryColor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
