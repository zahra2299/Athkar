import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/myThemeData.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadeth();
  }

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
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: 40,
              endIndent: 40,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  loadHadeth() async {
    String ahadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = ahadeth.split("#");
    //print(ahadethList);
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
  }
}
