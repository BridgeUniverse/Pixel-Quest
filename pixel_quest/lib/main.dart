import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_quest/models/habit.dart';
import 'package:pixel_quest/models/check_in.dart';
import 'package:pixel_quest/core/scope/app_scope.dart';
import 'package:pixel_quest/features/home/home_screen.dart';
import 'package:pixel_quest/core/logic/xp_logic.dart';


Future <void>  main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(CheckInAdapter());

  final habbitBox = await Hive.openBox<Habit>('habbits');
  final checkInBox = await Hive.openBox<CheckIn>('checkIns');

  await habbitBox.put('1', Habit(id: '1', name: 'Drink Water', colorValue: Colors.blue.value, icon: "water_icon", xpPerDone: 10));
  await checkInBox.put('1', CheckIn(habitId: '1', date: DateTime.now()));
  final checkIns = checkInBox.values.toList();
  final habitBox = habbitBox.values.toList();
  final xp = getXP(checkIns, habitBox);
  print('Total XP: $xp');
  print('Habits: ${habitBox.length}');
  print('CheckIns: ${checkIns.length}');
  
  
  runApp( MyApp(habbitBox: habbitBox, checkInBox: checkInBox,));
}

class MyApp extends StatelessWidget {
  final Box<Habit> habbitBox;
  final Box<CheckIn> checkInBox;
  const MyApp({super.key, required this.habbitBox, required this.checkInBox});
  
  @override
  Widget build(BuildContext context) {
    return AppScope(
      habbitBox: habbitBox,
      checkInBox : checkInBox ,
      child: MaterialApp(
        title: 'Pixel Quest',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

