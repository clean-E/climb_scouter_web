import 'package:climb_scouter_web/graphQL/client.dart';
import 'package:climb_scouter_web/graphQL/mutation.dart';
import 'package:climb_scouter_web/graphQL/query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserProvider with ChangeNotifier {
  Future createUser(String name, String password) async {
    MutationOptions queryOptions = MutationOptions(
        document: gql(MyMutation.createUser),
        variables: {"name": name, "password": password});
    QueryResult result = await Client.initClient().value.mutate(queryOptions);
    if (result.hasException) {
      print(result.exception!.graphqlErrors[0].message);

      return result.exception!.graphqlErrors[0].message;
    } else {
      final resultData = result.data?["createUser"];
      print(resultData);
      notifyListeners();
      return resultData;
    }
  }

  Future getUser(String id) async {
    QueryOptions queryOptions =
        QueryOptions(document: gql(MyQuery.getUser), variables: {"id": id});
    QueryResult result = await Client.initClient().value.query(queryOptions);
    if (result.hasException) {
      print(result.exception);
    }
    final resultData = result.data?["getUser"];
    print('getUserProvider : ${resultData}');
    notifyListeners();
    return resultData;
  }

  Future getUserList() async {
    QueryOptions queryOptions =
        QueryOptions(document: gql(MyQuery.getPowerRank));
    QueryResult result = await Client.initClient().value.query(queryOptions);
    if (result.hasException) {
      print(result.exception);
    }
    final resultData = result.data?["getPowerRank"];
    // print("getUserList: ${resultData}");
    notifyListeners();
    return resultData;
  }
}
