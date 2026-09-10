import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pixel_quest/models/habit.dart';
import 'package:pixel_quest/models/check_in.dart';

class AppScope extends InheritedWidget {
  static const String habbitBoxName = "habbits";
  static const String checkInBoxName = "checkIns";
  final Box<Habit> habbitBox;
  final Box<CheckIn> checkInBox;
  const AppScope({
    super.key,
    required this.habbitBox,
    required this.checkInBox,
    required super.child,
  });

  static AppScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'No AppScope found in context');
    return scope!;
  }
  
  @override
  bool updateShouldNotify(covariant AppScope oldWidget) {
    return habbitBox != oldWidget.habbitBox;
  }
}