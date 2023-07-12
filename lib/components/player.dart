import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:shooter_flame_game/components/enemy.dart';

class Player extends SpriteComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  Player() : super(size: Vector2(100, 50));
  Vector2 velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('player.png');
    position = Vector2(180, 665);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      print("hello");
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    // print(position.x);
    if (position.x >= 280 || position.x <= 0) {
      velocity.x = 0;
    }

    //_velocity.x = _horizontalDirection * _moveSpeed;
  }

  void onTapDown(TapDownInfo info) {
    if (info.eventPosition.global.x > 170) {
      velocity.x = 100;
    } else {
      velocity.x = -100;
    }
    print(velocity);
  }

  void onTapUp() {
    velocity.x = 0;
    print(velocity);
  }
}
