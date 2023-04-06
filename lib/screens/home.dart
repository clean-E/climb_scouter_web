import 'package:climb_scouter_web/screens/record.dart';
import 'package:climb_scouter_web/screens/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: false,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Climb Scouter"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: Icon(Icons.person))
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  color: index.isOdd ? Colors.white : Colors.teal[60],
                  height: 100,
                  child: Center(
                    child: Text(
                      '$index',
                      textScaleFactor: 5,
                    ),
                  ),
                ),
              );
            },
            childCount: 20,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Record()));
        },
        tooltip: 'Add Record',
        child: const Icon(Icons.add),
      ),
    );
  }
}
