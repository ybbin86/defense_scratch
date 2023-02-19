import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:defense_test/components/tower_component.dart';


void main() {
  final myGame = MyGame();
  runApp(GameWidget(game: myGame));
}

class MyGame extends FlameGame with TapDetector {
  final double tileSize = 50;

  @override
  void onTapDown(TapDownInfo event) {
    final double x = (event.eventPosition.game.x / tileSize);
    final double y = (event.eventPosition.game.y / tileSize);
    final double startX = x * tileSize;
    final double startY = y * tileSize;

    add(TowerComponent(startX, startY, tileSize));
  }

  // @override
  // Future<void> onLoad() async {
  //   add(GridComponent(
  //     size: Vector2.all(tileSize),
  //     lineColor: const Color(0xFF333333),
  //     lineWidth: 1,
  //   ));
  // }
}
