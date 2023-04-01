import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;
}