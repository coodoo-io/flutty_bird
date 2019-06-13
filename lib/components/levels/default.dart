import 'dart:math';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/box2d/box2d_component.dart';
import 'package:flutter/widgets.dart';

class DefaultLevel {
  List<BodyComponent> _bodies = new List();
  Random random = Random();

  DefaultLevel(Box2DComponent box) {
    // Decke
    _bodies.add(new WallBody(
        box, Orientation.portrait, 200.0, 0.05, Alignment.topCenter));
    // Linke Wand
    _bodies.add(new WallBody(
        box, Orientation.portrait, 0.05, 1.0, Alignment.centerLeft));
    // Boden
    _bodies.add(new WallBody(
        box, Orientation.portrait, 200.0, 0.05, Alignment.bottomCenter));
    // Rechte Wand
    // _bodies.add(new WallBody(
    //     box, Orientation.portrait, 0.05, 1.0, Alignment.centerRight));
    // Hindernisse
    // DURCH IRGENDEINEN GRUND IST WIDTH UND HEIGHT NULL!
    // Ist erstmal ok, da die kollision fest auf diese größe gestellt worden ist.
    for (var i = 0; i < 50; i++) {
      _bodies.add(getNewObstacle(box, i));
    }
  }

  CollisionBody getNewObstacle(box, i) {
    num x;
    num y;
    x = random.nextInt(50) + (i * 300) + 50;
    y = random.nextInt(190);
    if (random.nextBool() == true) {
      y = y * -1;
    }
    x = x.toDouble();
    y = y.toDouble();
    return CollisionBody(box, x, y, 100, 100);
  }

  List<BodyComponent> get bodies => _bodies;
}

class WallBody extends BodyComponent {
  Orientation orientation;
  double widthPercent;
  double heightPercent;
  Alignment alignment;

  bool first = true;

  WallBody(Box2DComponent box, this.orientation, this.widthPercent,
      this.heightPercent, this.alignment)
      : super(box) {
    _createBody();
  }

  void _createBody() {
    double width = box.viewport.width * widthPercent;
    double height = box.viewport.height * heightPercent;

    double x = alignment.x * (box.viewport.width - width);
    double y = (-alignment.y) * (box.viewport.height - height);

    final shape = new PolygonShape();
    shape.setAsBoxXY(width / 2, height / 2);

    final fixtureDef = new FixtureDef();
    fixtureDef.shape = shape;

    fixtureDef.restitution = 0.0;
    fixtureDef.friction = 0.2;
    final bodyDef = new BodyDef();
    bodyDef.position = new Vector2(x / 2, y / 2);
    Body groundBody = world.createBody(bodyDef);
    groundBody.createFixtureFromFixtureDef(fixtureDef);
    this.body = groundBody;
  }
}

class CollisionBody extends BodyComponent {
  double x;
  double y;
  double width;
  double height;

  bool first = true;

  CollisionBody(Box2DComponent box, this.x, this.y, double width, double height)
      : super(box) {
    _createBody();
  }

  void _createBody() {
    final shape = new PolygonShape();
    shape.setAsBoxXY(10.0 / 2, 10.0 / 2);

    final fixtureDef = new FixtureDef();
    fixtureDef.shape = shape;

    fixtureDef.restitution = 0.0;
    fixtureDef.friction = 0.2;
    final bodyDef = new BodyDef();
    bodyDef.position = new Vector2(x / 2, y / 2);
    Body groundBody = world.createBody(bodyDef);
    groundBody.createFixtureFromFixtureDef(fixtureDef);
    this.body = groundBody;
  }
}
