import 'dart:math';

import 'package:flame/box2d/box2d_component.dart';
import 'package:flutter/widgets.dart';
import 'package:flutty_bird/components/levels/default.dart';
import 'package:flutty_bird/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bird.dart';
import 'package:flame/flame.dart';

class FluttyWorld extends Box2DComponent {
  BirdComponent bird;
  int score = 0;
  int _highscore = 0;
  List<bool> pointGranted = List<bool>();
  Random random = Random();

  FluttyWorld() : super(scale: 4.0);
  List<BodyComponent> _bodies;

  Future<bool> setScore(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("score", value);
  }

  Future<int> getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("score");
  }

  void initializeWorld() {
    getScore().then((highscore) {
      print(highscore);
      _highscore = highscore;
    });
    Flame.audio.load('explosion.mp3');

    _bodies = new DefaultLevel(this).bodies;
    _bodies.forEach((body) {
      pointGranted.add(false);
    });
    bird = new BirdComponent(this);
    addAll(_bodies);
    add(bird);
  }

  @override
  void update(t) {
    super.update(t);
    bird.update(t);

    var i = 0;

    _bodies.forEach((body) {
      if (body.body.position.x < bird.body.position.x) {
        //don't score walls
        if (i > 2) {
          if (pointGranted[i] == false) {
            score++;
            if (_highscore < score) {
              _highscore = score;
            }
            pointGranted[i] = true;
          }
        }
      }

      if (bird.body.position.distanceTo(body.body.position) < 21) {
          setScore(_highscore).then((result) {
            runApp(InitialApp());
          });
        if (body is CollisionBody) {
          Flame.audio.play('explosion.mp3');
          setScore(_highscore).then((result) {
            runApp(InitialApp());
          });
        }
      }
      i++;
      body.update(t);
    });
    cameraFollow(bird, horizontal: 0);
  }
}
