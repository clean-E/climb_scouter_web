import 'package:climb_scouter_web/graphQL/client.dart';
import 'package:climb_scouter_web/graphQL/mutation.dart';
import 'package:climb_scouter_web/graphQL/query.dart';
import 'package:climb_scouter_web/models/record_Input.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RecordProvider with ChangeNotifier {
  Future createRecord(String name, String gym, List problems) async {
    MutationOptions mutationOptions =
        MutationOptions(document: gql(MyMutation.createRecord), variables: {
      "record": {"name": name, "gym": gym, "problems": problems}
    });
    QueryResult result =
        await Client.initClient().value.mutate(mutationOptions);
    if (result.hasException) {
      print(result.exception);
    }
    final resultData = result.data?["createRecord"];
    notifyListeners();
    return resultData;
  }

  Future deleteRecord(String id, String name, String password) async {
    MutationOptions mutationOprions = MutationOptions(
        document: gql(MyMutation.deleteRecord),
        variables: {"id": id, "name": name, "password": password});
    QueryResult result =
        await Client.initClient().value.mutate(mutationOprions);
    if (result.hasException) {
      print(result.exception);
      return result.exception!.graphqlErrors[0].message;
    }
    final resultData = result.data?["deleteRecord"];
    print(resultData);
    notifyListeners();
    return resultData;
  }

  Future editRecord(String id, String password, String name, String gym,
      List problems) async {
    MutationOptions mutationOprions = MutationOptions(
        document: gql(MyMutation.editRecord),
        variables: {
          "id": id,
          "password": password,
          "name": name,
          "gym": gym,
          "problems": problems
        });
    QueryResult result =
        await Client.initClient().value.mutate(mutationOprions);
    if (result.hasException) {
      print(result.exception);
    }
    final resultData = result.data?["editRecord"];
    notifyListeners();
    return resultData;
  }
}
