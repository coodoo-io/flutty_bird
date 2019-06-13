import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:box2d_flame/box2d.dart';
import 'package:flame/box2d/box2d_component.dart';
import 'package:flutty_bird/util.dart';
import 'dart:math';
import 'package:flame/flame.dart';

class BirdComponent extends BodyComponent {
  static const num BIRD_RADIUS = 13.0;
  bool flying;
  Random rnd = Random();

  ImagesLoader images = new ImagesLoader();

  BirdComponent(box2d) : super(box2d) {
    Flame.audio
        .loadAll(['flap-1.ogg', 'flap-2.ogg', 'flap-3.ogg', 'flap-4.ogg']);
    Flame.audio.disableLog();

    images.load('neutral', 'dart_bird.png');
    _createBody();
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void renderCircle(Canvas canvas, Offset center, double radius) {
    if (images.isLoading) {
      return;
    }

    paintImage(
        canvas: canvas,
        image: images.get('neutral'),
        rect: new Rect.fromCircle(center: center, radius: radius),
        fit: BoxFit.contain);
  }

  void _createBody() {
    final shape = new CircleShape();
    shape.radius = BirdComponent.BIRD_RADIUS;
    shape.p.x = 0.0;

    final activeFixtureDef = new FixtureDef();
    activeFixtureDef.shape = shape;
    activeFixtureDef.restitution = 0.0;
    activeFixtureDef.density = 0.05;
    activeFixtureDef.friction = 0.001;
    FixtureDef fixtureDef = activeFixtureDef;
    final activeBodyDef = new BodyDef();
    activeBodyDef.linearVelocity = new Vector2(0.0, 0.0);
    activeBodyDef.position = new Vector2(0.0, 15.0);
    activeBodyDef.type = BodyType.DYNAMIC;
    activeBodyDef.bullet = true;
    activeBodyDef.gravityScale = 11.0;
    BodyDef bodyDef = activeBodyDef;
    this.body = world.createBody(bodyDef)
      ..createFixtureFromFixtureDef(fixtureDef);
  }

  void onTapDown(TapDownDetails details) {
    Vector2 force = new Vector2(1.6, 8.0)..scale(560.0);
    body.applyLinearImpulse(
        force, Vector2(this.center.x - 5, this.center.y - 5), true);

    num nextInt = rnd.nextInt(4) + 1;
    Flame.audio.play('flap-$nextInt.ogg');
  }
}
