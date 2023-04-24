import 'package:climb_scouter_web/providers/user_provider.dart';
import 'package:climb_scouter_web/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _nameController;
  late TextEditingController _pwdController;
  bool _validate = false;
  dynamic createdUserValue;

  @override
  void dispose() {
    _nameController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  _SignInState() {
    _nameController = TextEditingController();
    _pwdController = TextEditingController();
  }

  Future<String> createUser(String name, String password) async {
    final createdUser = await Provider.of<UserProvider>(context, listen: false)
        .createUser(name, password);

    String createdUserValue = createdUser.toString();
    print("createdUserValue:${createdUserValue}");
    if (createdUserValue == "Already Exist Name") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("이미 존재하는 이름입니다. 다른 이름을 입력하세요")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${_nameController.text}님의 신규가입이 완료되었습니다.")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    setState(() {});
    ChangeNotifier();

    return createdUserValue;
  }

  // Future getUser(String id) async {
  //   final User =
  //       await Provider.of<UserProvider>(context, listen: false).getUser(id);
  //   return User;
  // }

  void checkEmptyField() {
    setState(() {
      _nameController.text.isEmpty && _pwdController.text.isEmpty
          ? _validate = true
          : _validate = false;
    });
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
                controller: _nameController,
                decoration: InputDecoration(
                    errorText: _validate ? "이름을 입력하세요" : null,
                    labelText: "Name",
                    suffixIcon: Icon(Icons.account_circle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
              child: TextField(
                controller: _pwdController,
                decoration: InputDecoration(
                    errorText: _validate ? "비밀번호를 입력하세요" : null,
                    labelText: "PWD",
                    suffixIcon: Icon(Icons.password)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      checkEmptyField();
                      if (!_validate) {
                        createUser(_nameController.text, _pwdController.text);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(50),
                      child: Text(
                        "신규등록",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
                    )),
                TextButton(
                    onPressed: () {
                      // checkEmptyField();
                      // if (!_validate) {
                      //   getUser(_nameController.text);
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      // }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(50),
                      child: Text("로그인", style: TextStyle(color: Colors.white)),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15)),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
