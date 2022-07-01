

import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
// ignore: camel_case_types
class studentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String guardian;
  @HiveField(4)
  final String contact;
  @HiveField(5)
  final String? image;
  // @HiveField(6)
  studentModel(
      {required this.name,
      required this.age,
      required this.guardian,
      required this.contact,
      this.image,
      this.id});
}
