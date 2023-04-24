import 'package:climb_scouter_web/providers/user_provider.dart';
import 'package:climb_scouter_web/screens/record.dart';
import 'package:climb_scouter_web/screens/record_detail.dart';
import 'package:climb_scouter_web/screens/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List usersNameList = [];
  List<dynamic>? usersData = [];
  int userCount = 0;

  Future<List> getUsersData() async {
    final getUData =
        await Provider.of<UserProvider>(context, listen: false).getUserList();

    return getUData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>?>(
        future: getUsersData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            usersData = snapshot.data;
            userCount = snapshot.data!.length;
            for (var user in usersData!) {
              usersNameList.add(user["name"]);
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  // pinned: false,
                  expandedHeight: 100,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Climb Scouter",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          icon: Icon(Icons.person)),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Text(
                          "Grade No.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 50, 20),
                        child: Text("Score",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 20, 150, 20),
                        child: Text("Name",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        color: index.isOdd
                            ? Colors.white
                            : Color.fromARGB(102, 178, 223, 219),
                        height: 70,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                                  child: Text(
                                    '${index + 1}.',
                                    textScaleFactor: 1,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                  child: Text(
                                    this.usersData![index]["power"].toString(),
                                    textScaleFactor: 1,
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 0, 70, 0),
                                child: Text(
                                  this.usersData![index]["name"],
                                  textScaleFactor: 1,
                                ),
                              ),
                              TextButton(
                                  onPressed: () async {
                                    final getUData =
                                        await Provider.of<UserProvider>(context,
                                                listen: false)
                                            .getUser(
                                                this.usersData![index]['id']);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RecordDetail(
                                                personalRecords: getUData)));
                                  },
                                  style: TextButton.styleFrom(
                                      minimumSize: Size(90, 15),
                                      backgroundColor: Colors.amberAccent[200],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "Detail",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                            ]),
                      ),
                    );
                  },
                  childCount: userCount,
                ))
              ],
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return Text("idn");
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        hoverElevation: 2,
        backgroundColor: Colors.pink,
        hoverColor: Colors.cyan,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Record(userNameList: usersNameList)));
        },
        tooltip: '운동 기록하기',
        isExtended: true,
        label: Row(
          children: [const Icon(Icons.add), Text("Add WorkOut")],
        ),
      ),
    );
  }
}
