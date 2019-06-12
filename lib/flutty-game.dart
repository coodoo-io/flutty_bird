import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutty_bird/components/flutty_world.dart';

class FluttyGame extends Game {
  final FluttyWorld fluttyWorld = new FluttyWorld();

  FluttyGame() {
    fluttyWorld.initializeWorld();
  }

  @override
  void render(Canvas canvas) {
    fluttyWorld.render(canvas);
  }

  @override
  void update(double t) {
    fluttyWorld.update(t);
  }

  @override
  void resize(Size size) {
    fluttyWorld.resize(size);
  }

  void onTapDown(TapDownDetails details) {
    fluttyWorld.bird.onTapDown(details);
  }
}
