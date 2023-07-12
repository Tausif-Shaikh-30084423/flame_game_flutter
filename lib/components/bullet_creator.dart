import 'dart:math';

import 'package:flame/components.dart';
import 'package:shooter_flame_game/components/bullet.dart';
import 'package:shooter_flame_game/components/player.dart';

class BulletCreator extends TimerComponent with HasGameRef {
  BulletCreator(this.player) : super(period: 0.6, repeat: true);
  Random random = Random();
  Player player;

  @override
  void onTick() {
    gameRef.add(Bullet(player));
  }
}
