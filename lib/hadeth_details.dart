import 'package:flutter/material.dart';
import 'package:islami/hadeth_model.dart';

import 'myThemeData.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "Hadeth details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: Theme.of(context).textTheme.bodyLarge),
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
                        "${args.content[index]}",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  itemCount: args.content.length),
            ),
          ),
        ),
      ),
    );
  }
}
