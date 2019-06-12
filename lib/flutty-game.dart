import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutty_bird/components/flutty_world.dart';
import 'package:flutty_bird/util.dart';

class FluttyGame extends Game {
  final FluttyWorld fluttyWorld = new FluttyWorld();
  // var move = 0;
  FluttyGame() {
    fluttyWorld.initializeWorld();
  }

  @override
  void render(Canvas canvas) {
    // Dies war ein Test zum bewegen von boxen
    // var rect = new Rect.fromLTWH(500.0 - move, 350.0, 50.0, 50.0);
    // var paint = new Paint()..color = new Color(0xFFFF0000);
    // canvas.drawRect(rect, paint);
    // var rect2 = new Rect.fromLTWH(700.0 - move, 180.0, 50.0, 50.0);
    // var paint2 = new Paint()..color = new Color(0xFFFFFF00);
    // canvas.drawRect(rect2, paint2);
    fluttyWorld.render(canvas);
  }

  @override
  void update(double t) {
    // move++;
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
