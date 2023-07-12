import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:shooter_flame_game/components/enemy.dart';
import 'package:shooter_flame_game/components/player.dart';

class Bullet extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Bullet(this.player) : super(size: Vector2(10, 70));
  // double posx;
  // double? posy;
  Player? player;

  final double _moveSpeed = 500;
  final int _verticalDirection = 1;
  final Vector2 _velocity = Vector2.zero();
  Random random = Random();

  @override
  Future<void> onLoad() async {
    // var myPlayer = player;
    // anotherBullet = Bullet(player);
    sprite = await gameRef.loadSprite('arrow.png');
    //position = Vector2(185, 655);

    addPosition((player?.x ?? 0) + 46, player?.y);
    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    if (other is Enemy) {
      removeFromParent();
      //enemy.addPosition(random.nextDouble() * 365, 0.0);
      print('YESS');
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    _velocity.y = _verticalDirection * _moveSpeed;
    position -= _velocity * dt;
    if (position.y <= 0) {
      // addPosition((player?.x ?? 0) + 46, player?.y);
      removeFromParent();
    }
    // if (position.y < 655) {}
  }

  void addPosition(double? posx, double? posy) {
    position = Vector2(posx ?? 0, posy ?? 0);
  }

  Future<void> addBullet() async {
    await add(Bullet(player));
  }
}
