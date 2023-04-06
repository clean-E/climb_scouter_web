import 'dart:html';
import 'package:climb_scouter_web/data/grade.dart';
import 'package:climb_scouter_web/data/spot.dart';
import 'package:climb_scouter_web/models/solved.dart';
import 'package:climb_scouter_web/providers/query/getGymGrade.dart';
import 'package:climb_scouter_web/widgets/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  List<Solved> solved = [];
  late Map grade = {};
  late List gradeList = [];
  late String gym;
  late int count;

  Future<List> getGrade(String gym) async {
    final gradeSetted =
        await Provider.of<GymGradeProvider>(context, listen: false)
            .getGymGrade(gym);

    gradeList = gradeSetted.values.toList();
    if (gradeList[0] == "GymGrade") {
      gradeList.removeAt(0);
    }
    print(gradeList);
    setState(() {});
    ChangeNotifier();
    return gradeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("하루 운동 기록")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustDropDown(
                      borderWidth: 0.8,
                      hintText: "암장 선택",
                      items: [
                        for (var s in Spots)
                          CustDropdownMenuItem(
                              value: s,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text("${s}"),
                              ))
                      ],
                      onChanged: (selectedGym) async {
                        getGrade(selectedGym);
                      })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustDropDown(
                        maxListHeight: 500,
                        hintText: "난이도 선택",
                        items: [
                          for (var l in gradeList)
                            CustDropdownMenuItem(
                                value: l,
                                child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: ColorLabel[l]
                                    // Row(
                                    //   children: [
                                    //     ColorLabel[l],
                                    //   ],
                                    // ),
                                    ))
                        ],
                        onChanged: (value) {
                          print(value.label);
                          grade = value.label;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustDropDown(
                        maxListHeight: 500,
                        hintText: "갯수 선택",
                        items: [
                          for (int i = 1; i <= 30; i++)
                            CustDropdownMenuItem(
                                value: i,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("${i}"),
                                ))
                        ],
                        onChanged: (value) {
                          print(value);
                          count = value;
                        }),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      // solved.add(value);
                    },
                    icon: Icon(Icons.add),
                    label: Text("추가"),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: solved.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: index.isOdd ? Colors.white : Colors.teal[60],
                      title: Text("${solved[index]}"),
                    );
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("등록"),
                    )),
              )
            ],
          ),
        ));
  }
}
