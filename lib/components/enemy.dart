import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:shooter_flame_game/components/bullet.dart';

class Enemy extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Enemy() : super(size: Vector2(50, 120));
  final double _moveSpeed = 300;
  final int _horizontalDirection = 1;
  Random pos = Random();
  double posy = 0.0;
  String name = '';
  final Vector2 _velocity = Vector2.zero();
  List<String> enemyName = [
    'orange_balloon.png',
    'green_balloon.png',
    'white_balloon.png',
  ];

  Future<void> onLoad() async {
    sprite = await gameRef
        .loadSprite(enemyName.elementAt(Random().nextInt(enemyName.length)));
    addPosition(pos.nextDouble() * 356, posy);
    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      removeFromParent();
      //bullet.addPosition(player?.x, player?.y);
      print('NONO');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    _velocity.y = _horizontalDirection * _moveSpeed;
    if (position.y >= 620) {
      // //_velocity.y = 0;
      // addPosition(
      //   pos.nextDouble() * 356,
      //   0.0,
      // );
      removeFromParent();
    }
    position += _velocity * dt;
  }

  void addPosition(double posx, posy) {
    position = Vector2(posx, posy);
  }
}
