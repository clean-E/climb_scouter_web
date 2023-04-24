import 'package:flutter/material.dart';

class GymGradeModel with ChangeNotifier {
  late String lv0,
      lv1,
      lv2,
      lv3,
      lv4,
      lv5,
      lv6,
      lv7,
      lv8,
      lv9,
      lv10,
      lv11,
      lv12,
      lv13,
      lv14,
      lv15;

  GymGradeModel({
    required this.lv0,
    required this.lv1,
    required this.lv2,
    required this.lv3,
    required this.lv4,
    required this.lv5,
    required this.lv6,
    required this.lv7,
    required this.lv8,
    required this.lv9,
    required this.lv10,
    required this.lv11,
    required this.lv12,
    required this.lv13,
    required this.lv14,
    required this.lv15,
  });

  GymGradeModel.fromJson(Map<String, dynamic> json)
      : lv0 = json['lv0'],
        lv1 = json['lv1'],
        lv2 = json['lv2'],
        lv3 = json['lv3'],
        lv4 = json['lv4'],
        lv5 = json['lv5'],
        lv6 = json['lv6'],
        lv7 = json['lv7'],
        lv8 = json['lv8'],
        lv9 = json['lv9'],
        lv10 = json['lv10'],
        lv11 = json['lv11'],
        lv12 = json['lv12'],
        lv13 = json['lv13'],
        lv14 = json['lv14'],
        lv15 = json['lv15'];
}

Map ColorLabel = {
  "흰색": Icon(Icons.circle, color: Colors.white),
  "노란색": Icon(Icons.circle, color: Colors.yellow),
  "주황색": Icon(Icons.circle, color: Colors.orange),
  "초록색": Icon(Icons.circle, color: Colors.green),
  "초록색+": Icon(Icons.add_circle, color: Colors.green),
  "파란색-": Icon(Icons.remove_circle_outline, color: Colors.blue),
  "파란색0": Icon(Icons.circle, color: Colors.blue),
  "파란색+": Icon(Icons.add_circle, color: Colors.blue),
  "남색-": Icon(Icons.remove_circle_outline, color: Colors.indigo),
  "남색0": Icon(Icons.circle, color: Colors.indigo),
  "남색+": Icon(Icons.add_circle, color: Colors.indigo),
  "빨간색-": Icon(Icons.remove_circle_outline, color: Colors.red),
  "빨간색0": Icon(Icons.circle, color: Colors.red),
  "빨간색": Icon(Icons.circle, color: Colors.red),
  "빨간색+": Icon(Icons.add_circle, color: Colors.red),
  "보라색-": Icon(Icons.remove_circle_outline, color: Colors.purple),
  "보라색0": Icon(Icons.circle, color: Colors.purple),
  "보라색+": Icon(Icons.add_circle, color: Colors.purple),
  "검정색-": Icon(Icons.remove_circle_outline, color: Colors.black),
  "검정색0": Icon(Icons.circle, color: Colors.black),
  "검정색+": Icon(Icons.add_circle, color: Colors.black),
  "회색-": Icon(Icons.remove_circle_outline, color: Colors.grey),
  "회색0": Icon(Icons.circle, color: Colors.grey),
  "회색+": Icon(Icons.add_circle, color: Colors.grey),
};
Map ColorLabelName = {
  "흰색": "하양",
  "노란색": "노랑",
  "주황색": "주황",
  "초록색": "초록",
  "초록색+": "불초록",
  "파란색-": "물파랑",
  "파란색0": "파랑",
  "파란색+": "불파랑",
  "남색-": "물남색",
  "남색0": "남색",
  "남색+": "불남색",
  "빨간색-": "물빨강",
  "빨간색0": "빨강",
  "빨간색": "빨강",
  "빨간색+": "불빨강",
  "보라색-": "물보라",
  "보라색0": "보라",
  "보라색+": "찐보라",
  "검정색-": "물검정",
  "검정색0": "검정",
  "검정색+": "불검정",
  "회색-": "물회색",
  "회색0": "회색",
  "회색+": "찐회색",
};
Map ColorLabelMatch = {
  "흰색": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.white),
    label: Text("하양"),
    onPressed: () {},
  ),
  "노란색": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.yellow),
    label: Text("노랑"),
    onPressed: () {},
  ),
  "주황색": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.orange),
    label: Text("주황"),
    onPressed: () {},
  ),
  "초록색": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.green),
    label: Text("초록"),
    onPressed: () {},
  ),
  "초록색+": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.green),
    label: Text("불초록"),
    onPressed: () {},
  ),
  "파란색-": TextButton.icon(
    icon: Icon(Icons.remove_circle_outline, color: Colors.blue),
    label: Text("물파랑"),
    onPressed: () {},
  ),
  "파란색0": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.blue),
    label: Text("파랑"),
    onPressed: () {},
  ),
  "파란색+": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.blue),
    label: Text("불파랑"),
    onPressed: () {},
  ),
  "남색-": TextButton.icon(
    icon: Icon(Icons.remove_circle_outline, color: Colors.indigo),
    label: Text("물남색"),
    onPressed: () {},
  ),
  "남색0": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.indigo),
    label: Text("남색"),
    onPressed: () {},
  ),
  "남색+": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.indigo),
    label: Text("불남색"),
    onPressed: () {},
  ),
  "빨간색-": TextButton.icon(
    icon: Icon(Icons.remove_circle_outline, color: Colors.red),
    label: Text("물빨강"),
    onPressed: () {},
  ),
  "빨간색0": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.red),
    label: Text("빨강"),
    onPressed: () {},
  ),
  "빨간색": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.red),
    label: Text("빨강"),
    onPressed: () {},
  ),
  "불빨강": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.red),
    label: Text("찐빨강"),
    onPressed: () {},
  ),
  "보라색-": TextButton.icon(
    icon: Icon(Icons.remove_circle_outline, color: Colors.purple),
    label: Text("물보라"),
    onPressed: () {},
  ),
  "보라색0": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.purple),
    label: Text("보라"),
    onPressed: () {},
  ),
  "보라색+": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.purple),
    label: Text("찐보라"),
    onPressed: () {},
  ),
  "검정색-": TextButton.icon(
    icon: Icon(Icons.remove_circle_outline, color: Colors.black),
    label: Text("물검정"),
    onPressed: () {},
  ),
  "검정색0": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.black),
    label: Text("검정"),
    onPressed: () {},
  ),
  "검정색+": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.black),
    label: Text("찐검정"),
    onPressed: () {},
  ),
  "회색-": TextButton.icon(
    icon: Icon(Icons.remove_circle_outline, color: Colors.grey),
    label: Text("물회색"),
    onPressed: () {},
  ),
  "회색0": TextButton.icon(
    icon: Icon(Icons.circle, color: Colors.grey),
    label: Text("회색"),
    onPressed: () {},
  ),
  "회색+": TextButton.icon(
    icon: Icon(Icons.add_circle, color: Colors.grey),
    label: Text("찐회색"),
    onPressed: () {},
  )
};

enum gymGrade {
  lv0,
  lv1,
  lv2,
  lv3,
  lv4,
  lv5,
  lv6,
  lv7,
  lv8,
  lv9,
  lv10,
  lv11,
  lv12,
  lv13,
  lv14,
  lv15,
}
