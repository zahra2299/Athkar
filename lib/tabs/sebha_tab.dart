import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String txt = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                counter++;
                if (counter == 33) {
                  if (txt == "سبحان الله") {
                    txt = "الحمد لله";
                  } else if (txt == "الحمد لله") {
                    txt = "الله أكبر";
                  } else {
                    txt = "سبحان الله";
                  }
                  counter = 0;
                }
                setState(() {});
              },
              child: Image.asset("assets/images/sebha_image.png")),
          SizedBox(
            height: 8,
          ),
          Text(AppLocalizations.of(context)!.totalOfTasbeeh,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: MyThemeData.primaryColor)),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              "$counter",
              style: TextStyle(color: MyThemeData.blackColor),
            )),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
                child: Text(
              "$txt",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
          ),
        ],
      ),
    );
  }
}
