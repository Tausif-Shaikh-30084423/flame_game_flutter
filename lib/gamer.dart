import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:shooter_flame_game/components/another_bullet.dart';
import 'package:shooter_flame_game/components/background_world.dart';
import 'package:shooter_flame_game/components/enemy.dart';
import 'package:shooter_flame_game/components/enemy_creator.dart';
import 'package:shooter_flame_game/components/player.dart';

import 'components/bullet.dart';
import 'components/bullet_creator.dart';

Player player = Player();
BackGroundWorld backGroundWorldImage = BackGroundWorld();
List<Enemy> enemyList = [];
Bullet bullet = Bullet(player);
AnotherBullet anotherBullet = AnotherBullet(player);
EnemyCreator enemyCreator = EnemyCreator();
BulletCreator bulletCreator = BulletCreator(player);

class Gamer extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection, TapDetector {
  Gamer();

  @override
  Future<void> onLoad() async {
    add(backGroundWorldImage);
    add(player);
    add(bullet);
    add(enemyCreator);
    add(bulletCreator);
    ;
    super.onLoad();
  }
  //
  // @override
  // void render(Canvas c) {
  //   enemyList.forEach((element) {
  //     element.render(c);
  //   });
  //   super.render(c);
  // }

  // void spawner() {
  //   timer.Timer.periodic(Duration(seconds: 1), (timer) {
  //     enemyList.add(Enemy(player));
  //   });
  // }

  @override
  void onTapUp(TapUpInfo info) {
    player.onTapUp();
    super.onTapUp(info);
  }

  @override
  void onTapDown(TapDownInfo info) {
    player.onTapDown(info);
    super.onTapDown(info);
  }

  // @override
  // void onTap() {
  //   // TODO: implement onTap
  //   super.onTap();
  //   if (player.x > 150) {
  //     player.x = player.x + 6;
  //   } else {
  //     player.x = player.x - 6;
  //   }
  //   print(player.x + 6);
  // }

  @override
  void update(double dt) {
    enemyList.forEach((element) {
      element.update(dt);
    });
    super.update(dt);
    //shooBullets();
  }

// Future<void> shooBullets() async {
//   await Future.delayed(Duration(seconds: 2));
//   for (int i = 0; i < 2; i++) {
//     add(Bullet(player));
//   }
// }
}
