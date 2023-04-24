import 'package:climb_scouter_web/data/grade.dart';
import 'package:climb_scouter_web/models/record_Input.dart';
import 'package:flutter/material.dart';

class RecordDetail extends StatelessWidget {
  RecordDetail({Key? key, required this.personalRecords}) : super(key: key);
  dynamic personalRecords;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${personalRecords}님의 기록 상세")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: personalRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  List theDaysRecord = personalRecords['records'][index];
                  return Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    color: index.isOdd
                        ? Colors.white
                        : Color.fromARGB(90, 178, 223, 219),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              personalRecords['date'],
                              style: TextStyle(color: Colors.grey),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text("${personalRecords['gym']}"),
                            ),
                            GridView.builder(
                              itemCount: theDaysRecord.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: ColorLabel[
                                            personalRecords['Problems'][index]
                                                ['grade']]),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 20, 0),
                                      child: Text(
                                          "${personalRecords['Problems'][index]['count']}"),
                                    ),
                                  ],
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.7,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // solved.removeAt(index);
                                // setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.teal,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // solved.removeAt(index);
                                // setState(() {});
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.teal,
                              ),
                            )
                          ],
                        ),
                      ],
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
