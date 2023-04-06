import 'package:climb_scouter_web/graphQL/client.dart';
import 'package:climb_scouter_web/providers/query/getGymGrade.dart';
import 'package:climb_scouter_web/screens/home.dart';
import 'package:climb_scouter_web/screens/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future main() async {
  // initializeDateFormatting('ko_KR', null);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: Client.initClient(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(backgroundColor: Colors.teal),
            home: MultiProvider(providers: [
              ChangeNotifierProvider(create: (context) => GymGradeProvider())
            ], child: Record())));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  //Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
