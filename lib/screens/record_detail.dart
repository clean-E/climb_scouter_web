import 'package:climb_scouter_web/data/grade.dart';
import 'package:climb_scouter_web/models/record_Input.dart';
import 'package:climb_scouter_web/providers/gymGrade_provider.dart';
import 'package:climb_scouter_web/providers/record_provider.dart';
import 'package:climb_scouter_web/screens/home.dart';
import 'package:climb_scouter_web/screens/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordDetail extends StatefulWidget {
  RecordDetail({Key? key, required this.personalRecords}) : super(key: key);
  dynamic personalRecords;

  @override
  State<RecordDetail> createState() => _RecordDetailState();
}

class _RecordDetailState extends State<RecordDetail> {
  late Map gradeSetted = {};
  TextEditingController _pwdController = TextEditingController();
  late String name = widget.personalRecords['name'];
  late String _id = "";
  late String password = _pwdController.text;

  Future getGymGrade(String gym) async {
    final gradeSetted =
        await Provider.of<GymGradeProvider>(context, listen: false)
            .getGymGrade(gym);
    gradeSetted.remove("__typename");
    print(gradeSetted);

    // gradeList = gradeSetted.values.toList();
    // gradeKey = gradeSetted.keys.toList();

    // setState(() {});
    ChangeNotifier();
    return gradeSetted;
  }

  Future deleteRecord(id, name, password) async {
    final delRecordValue =
        await Provider.of<RecordProvider>(context, listen: false)
            .deleteRecord(id, name, password);
    if (delRecordValue == "Wrong Password") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("비밀번호가 일치하지 않습니다.")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("기록이 삭제되었습니다.")));
      Navigator.of(context).pop();
    }
    setState(() {});
    ChangeNotifier();
    return delRecordValue;
  }

  @override
  void dispose() {
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List records = widget.personalRecords['records'];
    return Scaffold(
      appBar: AppBar(title: Text("${widget.personalRecords['name']}님의 기록 상세")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (BuildContext context, int index) {
                  Map theDayRecord = records[index];
                  // getGymGrade(theDayRecord['gym']);
                  print("theDayRecord: ${theDayRecord}");
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index.isOdd
                            ? Colors.white
                            : Color.fromARGB(90, 178, 223, 219),
                      ),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                theDayRecord['date'].substring(0, 10),
                                style: TextStyle(color: Colors.grey),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text("${theDayRecord['gym']}"),
                              ),
                              SizedBox(
                                width: 400,
                                height: 100,
                                child: GridView.builder(
                                  // scrollDirection: Axis.horizontal,
                                  itemCount: theDayRecord['problems'].length,
                                  itemBuilder: (context, index) {
                                    // dynamic solvedGrade = gradeSetted[
                                    //     theDayRecord['problems'][index]['grade']];
                                    // print('solvedGrade : ${solvedGrade}');
                                    return Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                                "${theDayRecord['problems'][index]['grade']}")
                                            // ColorLabel[solvedGrade]
                                            ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 20, 0),
                                          child: Text(
                                              "${theDayRecord['problems'][index]['count']}"),
                                        ),
                                      ],
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    childAspectRatio: 1,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          title: Text("비밀번호를 입력하세요."),
                                          content: TextField(
                                            controller: _pwdController,
                                            maxLines: 1,
                                            // decoration: InputDecoration(),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: (() {
                                                  dispose();
                                                  Navigator.of(context).pop();
                                                }),
                                                child: Text("cancel")),
                                            TextButton(
                                                onPressed: (() {
                                                  deleteRecord(
                                                      _id, name, password);
                                                }),
                                                child: Text("delete"))
                                          ],
                                        );
                                      }));
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.teal,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Record(
                                              userNameList: [name],
                                              personalRecord:
                                                  widget.personalRecords[
                                                      "records"][index])));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
