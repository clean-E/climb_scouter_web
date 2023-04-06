import 'package:climb_scouter_web/data/grade.dart';
import 'package:climb_scouter_web/graphQL/client.dart';
import 'package:climb_scouter_web/graphQL/query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GymGradeProvider with ChangeNotifier {
  Future getGymGrade(String gym) async {
    QueryOptions queryOptions = QueryOptions(
        document: gql(MyQuery.getGymGrade), variables: {"gymName": gym});
    QueryResult result = await Client.initClient().value.query(queryOptions);
    if (result.hasException) {
      print("exception : ${result.exception}");
    }
    final resultData = result.data?["getGymGrade"];
    // final gymGrade = GymGrade.fromJson(resultData);
    notifyListeners();

    return resultData;
  }
}
