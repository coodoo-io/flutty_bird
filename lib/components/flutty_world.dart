import 'dart:math';

import 'package:flame/box2d/box2d_component.dart';
import 'package:flutter/widgets.dart';
import 'package:flutty_bird/components/levels/default.dart';
import 'bird.dart';
import 'package:flame/flame.dart';

class FluttyWorld extends Box2DComponent {
  BirdComponent bird;
  num score = 0;
  List<bool> pointGranted = List<bool>();
  Random random = Random();

  FluttyWorld() : super(scale: 4.0);
  List<BodyComponent> _bodies;

  void initializeWorld() {
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

    //print(_bodies[1].body.position.x);
    //print(bird.body.position.x);
    _bodies.forEach((body) {
      if (body.body.position.x < bird.body.position.x) {
        //don't score walls
        if (i > 2) {
          if (pointGranted[i] == false) {
            score++;
            pointGranted[i] = true;
          }
        }
      }

      if (bird.body.position.distanceTo(body.body.position) < 21) {
        if (body is CollisionBody) {
          Flame.audio.play('explosion.mp3');
          remove(bird);
          pointGranted.clear();
          for (var i = 0; i < _bodies.length; i++) {
            this.pointGranted.add(false);
          }
          score = 0;
          bird = new BirdComponent(this);
          add(bird);
        }
      }
      i++;
      body.update(t);
    });
    cameraFollow(bird, horizontal: 0);
  }
}
