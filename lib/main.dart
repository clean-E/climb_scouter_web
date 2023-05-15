import 'package:climb_scouter_web/graphQL/client.dart';
import 'package:climb_scouter_web/providers/record_provider.dart';
import 'package:climb_scouter_web/providers/user_provider.dart';
import 'package:climb_scouter_web/providers/gymGrade_provider.dart';
import 'package:climb_scouter_web/screens/home.dart';
import 'package:climb_scouter_web/screens/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  // initializeDateFormatting('ko_KR', null);
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: 'assets/config/.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: Client.initClient(),
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => GymGradeProvider()),
              ChangeNotifierProvider(create: (context) => UserProvider()),
              ChangeNotifierProvider(create: (context) => RecordProvider()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.teal)),
                home: Home())));
  }
}
