import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pixel_quest/models/habit.dart';
import 'package:pixel_quest/models/check_in.dart';
import 'package:pixel_quest/core/scope/app_scope.dart';


int getXP(List<CheckIn> checkIns, List<Habit> habitBox) {
  int xp = 0;
  for (int i = 0; i < checkIns.length; i++) {
    for(int j = 0; j < habitBox.length; j++) {
      if (habitBox[j].id == checkIns[i].habitId) {
      xp += habitBox[j].xpPerDone;
      }
    }
  }
  return xp;
}

  
