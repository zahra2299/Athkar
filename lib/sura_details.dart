import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/sure_details_provider.dart';
import 'package:islami/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "Sura details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<SuraDetailsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    // if (provider.verses.isEmpty) {
    //   provider.loadFile(args.index);
    // }

    //.. allows to access anything in SuraDetailsProvider
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill),
          ),
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
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
                            "${provider.verses[index]}(${index + 1})",
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      itemCount: provider.verses.length),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
