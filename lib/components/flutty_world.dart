import 'package:flame/box2d/box2d_component.dart';
import 'package:flutty_bird/components/levels/default.dart';
import 'bird.dart';

class FluttyWorld extends Box2DComponent {
  BirdComponent bird;

  FluttyWorld() : super(scale: 4.0);
  List<BodyComponent> _bodies;
  void initializeWorld() {
    _bodies = new DefaultLevel(this).bodies;
    bird = new BirdComponent(this);
    addAll(_bodies);
    add(bird);
  }

  @override
  void update(t) {
    super.update(t);
    bird.update(t);
    // var i = 0;
    _bodies.forEach((body) {
      if(bird.body.position.distanceTo(body.body.position) < 21){
        if (body is CollisionBody) {
        remove(bird);
        bird = new BirdComponent(this);
        add(bird);
        }
      }
      // i++;
      body.update(t);
    });
    cameraFollow(bird, horizontal: 0.4, vertical: 0.4);
  }
}
