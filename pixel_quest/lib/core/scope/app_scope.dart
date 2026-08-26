import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pixel_quest/models/habit.dart';

class AppScope extends InheritedWidget {
  static const String habbitBoxName = "habbits";
  final Box<HabitAdapter> habbitBox;
  const AppScope({
    super.key,
    required this.habbitBox,
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