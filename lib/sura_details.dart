import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/sura_mosel.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "Sura details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: MyThemeData.primaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.primaryColor,
                        indent: 40,
                        endIndent: 40,
                      ),
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "${verses[index]}(${index + 1})",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  itemCount: verses.length),
            ),
          ),
        ),
      ),
    );
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
