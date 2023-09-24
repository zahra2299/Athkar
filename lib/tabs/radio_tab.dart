import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text(
          AppLocalizations.of(context)!.quranBroadcast,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous,
                  color: MyThemeData.primaryColor, size: 36),
              Icon(Icons.play_arrow, color: MyThemeData.primaryColor, size: 36),
              Icon(Icons.skip_next, color: MyThemeData.primaryColor, size: 36),
            ]),
      ],
    );
  }
}
