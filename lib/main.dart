import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'flutty-game.dart';
import 'package:flutter/gestures.dart';


void main() => runApp(MyApp());

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


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        canvasColor: Colors.black,
        brightness: Brightness.dark,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.greenAccent),
        ),
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Der große Spaß"),
        shape: Border(
          top: BorderSide(style: BorderStyle.none),
          left: BorderSide(style: BorderStyle.none),
          right: BorderSide(style: BorderStyle.none),
          bottom: BorderSide(width: 2.0, color: Colors.greenAccent),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {runGame();},
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.greenAccent,
                  ),
                ),
                color: Colors.black,
                highlightColor: Colors.green,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.greenAccent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Ende',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.greenAccent,
                  ),
                ),
                color: Colors.black,
                highlightColor: Colors.green,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.greenAccent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.greenAccent),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          "+",
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 30,
          ),
        ),
        onPressed: () => print("Leon was here"),
      ),
    );
  }
}