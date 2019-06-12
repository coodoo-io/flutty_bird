import 'package:flame/box2d/box2d_component.dart';
import 'package:flutty_bird/components/levels/default.dart';
import 'bird.dart';

class FluttyWorld extends Box2DComponent {
  BirdComponent bird;

  FluttyWorld() : super(scale: 4.0);

  void initializeWorld() {
    addAll(new DefaultLevel(this).bodies);
    add(bird = new BirdComponent(this));
  }

  @override
  void update(t) {
    super.update(t);
    cameraFollow(bird, horizontal: 0.4, vertical: 0.4);
  }
}
