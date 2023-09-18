import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/myThemeData.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 3,
        ),
        Text(
          "Ahadeth",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black),
        ),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                allAhadeth[index].title,
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  loadHadeth() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
      setState(() {});
    }).catchError((e) {
      print(e.toString());
    });
  }
}
