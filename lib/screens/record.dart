import 'package:climb_scouter_web/models/record_Input.dart';
import 'package:climb_scouter_web/providers/gymGrade_provider.dart';
import 'package:climb_scouter_web/providers/record_provider.dart';
import 'package:climb_scouter_web/providers/user_provider.dart';
import 'package:climb_scouter_web/screens/home.dart';
import 'package:climb_scouter_web/widgets/dropdown_menu.dart';
import 'package:climb_scouter_web/data/grade.dart';
import 'package:climb_scouter_web/data/spot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Record extends StatefulWidget {
  Record({Key? key, required this.userNameList, this.personalRecord})
      : super(key: key);
  List userNameList;
  dynamic personalRecord;
  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  late String grade;
  late List gradeSelected = [];
  late String name = widget.personalRecord["name"] ?? "";
  late List gradeList = [];
  late List gradeKey = [];
  late List userList = widget.userNameList;
  late String gym = widget.personalRecord["gym"] ?? "";
  late int count;
  late int gymIndex = Spots.indexOf(widget.personalRecord["gym"]) ?? -1;

  late int nameIndex =
      widget.userNameList.indexOf(widget.personalRecord["name"]) ?? -1;
  late List<Problems> solved = [];
  late Map gradeSetted = {};

  Future getGrade(String gym) async {
    final gradeSetted =
        await Provider.of<GymGradeProvider>(context, listen: false)
            .getGymGrade(gym);
    gradeSetted.remove("__typename");

    gradeList = gradeSetted.values.toList(); // 한글
    gradeKey = gradeSetted.keys.toList(); // 영문+숫자

    setState(() {});
    ChangeNotifier();
    return gradeSetted;
  }

  Future createDaysRecord(name, gym, solved) async {
    final createRecordByDay =
        await Provider.of<RecordProvider>(context, listen: false)
            .createRecord(name, gym, solved);

    setState(() {});
    ChangeNotifier();
  }

  Future editRecord(String id, String password, String name, String gym,
      List problems) async {
    final editRecordValue =
        await Provider.of<RecordProvider>(context, listen: false)
            .editRecord(id, password, name, gym, problems);

    setState(() {});
    ChangeNotifier();
    return editRecordValue;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.personalRecord != null) {
      for (var element in widget.personalRecord["problems"]) {
        Problems p = Problems(grade: element['grade'], count: element['count']);
        solved.add(p);

        gradeSelected.add(element['grade']);
        print(gradeSelected);
      }
      getGrade(gym);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("The Day WorkOut Record")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustDropDown(
                            // defaultSelectedIndex: nameIndex,
                            maxListHeight: 500,
                            borderWidth: 1,
                            hintText: "Choose Name",
                            items: [
                              for (var u in userList)
                                CustDropdownMenuItem(
                                  value: u,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "${u}",
                                    ),
                                  ),
                                )
                            ],
                            onChanged: (selectedName) async {
                              name = selectedName;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustDropDown(
                            // defaultSelectedIndex: gymIndex,
                            borderWidth: 0.8,
                            hintText: "Choose Gym",
                            items: [
                              for (var g in GymNameMapping.keys)
                                CustDropdownMenuItem(
                                    value: g,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Text("${g}"),
                                    ))
                            ],
                            onChanged: (selectedGym) async {
                              getGrade(GymNameMapping[selectedGym]);
                            }),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustDropDown(
                        maxListHeight: 500,
                        hintText: "Choose Grade",
                        items: [
                          for (var l in gradeList)
                            CustDropdownMenuItem(
                                value: l,
                                child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: ColorLabel[l]))
                        ],
                        onChanged: (selectedGrade) {
                          int findGrade = gradeList.indexOf(selectedGrade);
                          grade = gradeKey[findGrade];
                          gradeSelected.add(selectedGrade);
                          setState(() {});
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustDropDown(
                        maxListHeight: 500,
                        hintText: "Choose number",
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
                        onChanged: (countSelected) {
                          count = countSelected;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton.icon(
                      onPressed: () {
                        Problems problem = Problems(grade: grade, count: count);
                        solved.add(problem);

                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: TextButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.teal[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              solved.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                              child: Text(
                                "Color",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                            child: Text("Grade",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 150, 0),
                            child: Text("Count",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: solved.length,
                    itemBuilder: (BuildContext context, int index) {
                      Problems key = solved[index];
                      int findGrade = gradeKey.indexOf(gradeSelected[index]);
                      gradeSelected[index] = gradeList[findGrade];
                      print(gradeSelected[index]);
                      return Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        color: index.isOdd
                            ? Colors.white
                            : Color.fromARGB(90, 178, 223, 219),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: ColorLabel[gradeSelected[index]]),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text(
                                  "${ColorLabelName[gradeSelected[index]]}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 70, 0),
                              child: Text("${key.count}"),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                solved.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.teal,
                              ),
                              label: Text("delete",
                                  style: TextStyle(color: Colors.teal)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      createDaysRecord(name, gym, solved);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${name}님의 운동 기록이 등록되었습니다.")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    style: TextButton.styleFrom(
                        minimumSize: Size(150, 60),
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Add WorkOut",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
