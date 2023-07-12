import 'dart:math';

import 'package:flame/components.dart';
import 'package:shooter_flame_game/components/enemy.dart';

class EnemyCreator extends TimerComponent with HasGameRef {
  EnemyCreator() : super(period: 1.5, repeat: true);
  Random random = Random();

  @override
  void onTick() {
    gameRef.addAll(List.generate(1, (index) => Enemy()));
  }
}
