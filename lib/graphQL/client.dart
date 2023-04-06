import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Client {
  static final HttpLink httpLink = HttpLink(
      'https://port-0-climber-scouter-6g2llf922ou4.sel3.cloudtype.app/graphql');

  static ValueNotifier<GraphQLClient> initClient() {
    ValueNotifier<GraphQLClient> client =
        ValueNotifier(GraphQLClient(link: httpLink, cache: GraphQLCache()));
    return client;
  }
}
