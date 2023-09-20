import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.local == "en"
                            ? MyThemeData.primaryColor
                            : MyThemeData.blackColor)),
                provider.local == "en"
                    ? Icon(Icons.done,
                        size: 30, color: MyThemeData.primaryColor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.local == "ar"
                            ? MyThemeData.primaryColor
                            : MyThemeData.blackColor)),
                provider.local == "ar"
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
