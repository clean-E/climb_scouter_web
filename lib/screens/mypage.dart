import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Page")),
      body: Column(),
    );
  }
}
