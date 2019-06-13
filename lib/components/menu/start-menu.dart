import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutty_bird/main.dart';

class StartMenu extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<StartMenu> {
  var _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dart_bird.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('Flutty-Bird'),
            ),
            Image.asset(
              'assets/images/dart_bird.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
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
                onPressed: () {
                  runGame();
                },
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
