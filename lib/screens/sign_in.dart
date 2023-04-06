import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _idController;
  late TextEditingController _pwdController;

  _SignInState() {
    _idController = TextEditingController();
    _pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 50, 100, 20),
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                    labelText: "ID", suffixIcon: Icon(Icons.account_circle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
              child: TextField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "PWD", suffixIcon: Icon(Icons.password)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(50),
                  child: Text("Sign up"),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(50),
                  child: Text("Sign In"),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
