import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutty_bird/components/menu/start-menu.dart';
import 'flutty-game.dart';
import 'package:flutter/gestures.dart';

var points = 3;

void main() => runApp(InitialApp());

void runGame() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  FluttyGame game = FluttyGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bird',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        canvasColor: Colors.black,
        brightness: Brightness.dark,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.greenAccent),
        ),
      ),
      home: StartMenu(),
    );
  }
}
