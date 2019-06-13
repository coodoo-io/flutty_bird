import 'package:flame/game.dart';
import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutty_bird/components/flutty_world.dart';

class FluttyGame extends Game {
  final FluttyWorld fluttyWorld = new FluttyWorld();
  ui.ParagraphBuilder paragraph =
      new ui.ParagraphBuilder(new ui.ParagraphStyle());
  String scoreText = 'Score: 0';

  FluttyGame() {
    paragraph.pushStyle(
        new ui.TextStyle(color: new Color(0xFFFFFFFF), fontSize: 12.0));
    fluttyWorld.initializeWorld();
  }

  @override
  void render(Canvas canvas) {
    paragraph.addText(scoreText);
    var p = paragraph.build()
      ..layout(new ui.ParagraphConstraints(width: 180.0));
    canvas.drawParagraph(p, new Offset(22, 70));
    fluttyWorld.render(canvas);
  }

  @override
  void update(double t) {
    // move++;
    fluttyWorld.update(t);

    num score = fluttyWorld.score;
    scoreText = 'Score: $score';
  }

  @override
  void resize(Size size) {
    fluttyWorld.resize(size);
  }

  void onTapDown(TapDownDetails details) {
    fluttyWorld.bird.onTapDown(details);
  }
}
