import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:defense_test/components/bullet_component.dart';

class TowerComponent extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  late TimerComponent bulletCreator;

  TowerComponent(double startX, double startY, double tileSize) {
    final rectangle = RectangleComponent(
      position: Vector2(startX, startY),
      size: Vector2(tileSize, tileSize),
      paint: BasicPalette.white.paint(),
    );
    add(rectangle);
  }


  @override
  Future<void> onLoad() async {
    add(CircleHitbox());
    add(
      bulletCreator = TimerComponent(
        period: 0.05,
        repeat: true,
        autoStart: false,
        onTick: _createBullet,
      ),
    );
    bulletCreator.timer.start();
  }
  

  final _bulletAngles = [0.5, 0.3, 0.0, -0.5, -0.3];
  void _createBullet() {
    gameRef.addAll(
      _bulletAngles.map(
        (angle) => BulletComponent(
          position: position + Vector2(0, -size.y / 2),
          angle: angle,
        ),
      ),
    );
  }
}