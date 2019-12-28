import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:rive_flutter/minionController.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            SafeArea(
              child: Minion(),
            )
          ],
        ),
      ),
    );
  }
}

class Minion extends StatefulWidget {
  @override
  _MinionState createState() => _MinionState();
}

class _MinionState extends State<Minion> {
  MinionController minionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minionController = MinionController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 300,
            child: FlareActor(
              "./assets/flare/minion.flr",
              controller: minionController,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    minionController.dance();
                  },
                  child: Text("Dance"),
                ),
                InkWell(
                  onTap: () {
                    minionController.jump();
                  },
                  child: Text("Jump"),
                ),
                InkWell(
                  onTap: () {
                    minionController.wave();
                  },
                  child: Text("Wave"),
                )
              ],
            )
        ],
      ),
    );
  }
}
