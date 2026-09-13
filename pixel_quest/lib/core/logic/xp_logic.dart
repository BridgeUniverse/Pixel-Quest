import 'package:pixel_quest/models/habit.dart';
import 'package:pixel_quest/models/check_in.dart';

class LevelProgress {
  final int level;
  final int xp;
  final int xpForNextLevel;

  LevelProgress({
    required this.level,
    required this.xp,
    required this.xpForNextLevel,
  });

}

int getXP (List<CheckIn> checkIns, List<Habit> habitBox) {
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

  LevelProgress getLevelProgress(int xp) {
    int level = 1;
    int xpForNextLevel = 100;
    while (xp >= xpForNextLevel) {
      level++;
      xp -= xpForNextLevel;
      xpForNextLevel = (level * 100);
    }
    return LevelProgress(
      level: level, 
      xp: xp, 
      xpForNextLevel: xpForNextLevel
      );
  }



String getTitle(int level) {
  final rank = ((level-1)~/4)+1;
  final tier = ((level-1)%4)+1;

  String rankTitle;
  String tierTitle;

  switch(rank){
    case 1:
      rankTitle = "🌱 Новичок";
      break ;
    case 2:
      rankTitle = "⚔️ Воин";
      break;   
    case 3:
      rankTitle = "🐉 Герой";
      break;  
    default :
      rankTitle = "👑 Легенда";
      break ;
  } 
  switch(tier){
    case 1:
      tierTitle = "I";
      break;
    case 2:
      tierTitle = "II";
      break;
    case 3: 
      tierTitle = "III";
      break;
    case 4:
      tierTitle = "IV";
      break;
    default :
      tierTitle = "" ;
      break;
  }
  if(rank == 4) {
    return rankTitle;
  }else {
    return "$rankTitle $tierTitle";
  }
  
}


