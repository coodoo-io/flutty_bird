import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutty_bird/components/menu/start-menu.dart';
import 'package:flutty_bird/services/share_preferences.dart';
import 'package:flutty_bird/services/shared_preferences_model.dart';
import 'flutty-game.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

// void main() => runApp(InitialApp());

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(InitialApp());
}

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
    // Provider wird für Dependency Injection genutzt
    return MultiProvider(
      providers: [
        Provider.value(
          value: SharedPreferencesService(),
        ),
        ProxyProvider<SharedPreferencesService, SharedPreferencesModel>(
          // Dependency injection
          builder: (context, api, homeModel) =>
              SharedPreferencesModel(sharedPreferencesService: api),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
