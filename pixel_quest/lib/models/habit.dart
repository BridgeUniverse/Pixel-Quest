import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 0)
class Habit extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String icon;

  @HiveField(3)
  int colorValue;

  @HiveField(4)
  int xpPerDone;


  Habit({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.icon,
    required this.xpPerDone,
  });


}