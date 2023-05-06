class CreateRecordInput {
  late String name;
  late String gym;
  late String grade;
  late int count;
  late Map problems = {"grade": grade, "count": count};
  CreateRecordInput(
      {required this.name, required this.gym, required this.problems});
}

class Problems {
  late String grade;
  late int count;
  Problems({required this.grade, required this.count});

  // Problems.fromJson(Map<String, dynamic> json)
  //     : grade = json['grade'],
  //       count = json['count'];

  Map<String, dynamic> toJson() => {'grade': grade, 'count': count};
}
// CreateRecordInput: {
// 	name: string
// 	gym: string ('theClimb', 'thePlastic')
// 	problems: {
// 		grade: string
// 		count: number
// 	}
// }