import 'package:hive/hive.dart';


part 'check_in.g.dart';

@HiveType(typeId: 1)
class CheckIn extends HiveObject {
  @HiveField(0)
  final String habitId;

  @HiveField(1)
  final DateTime date;


  CheckIn({
    required this.habitId,
    required this.date,
  });

}