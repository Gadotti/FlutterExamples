import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Center(
        child: Container(
            width: 150,
            height: 150,
            child: FlareActor(
              "assets/Gears_loading.flr",
              animation: "spin1",
              isPaused: false,
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeSplash()
        )
      );
    });
  }
}

class HomeSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Flutter + Flare Rive",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 100,
            width: 100,
            child: FlareActor(
              "assets/PulseHeart.flr",
              animation: "pulse",
            ),
          )
        ],        
      ),      
    );
  }
}

//Exemplo de como controlar a animação, trocar a animal ou fazer a pausa.
// Aplique a Home abaixo na iniciação para observar.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _anim = "spin1";
  bool _isPaused = false;
  IconData icon = Icons.pause;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isPaused = !_isPaused;
            if (_isPaused) {
              icon = Icons.pause;
            }
            else {
              icon = Icons.play_arrow;
            }
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(icon),        
      ),      
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_anim == "spin1") {
                _anim = "spin2";
              }
              else {
                _anim = "spin1";
              }
            });
          },
          child: Container(
            width: 150,
            height: 150,
            child: FlareActor(
              "assets/Gears_loading.flr",
              animation: _anim,
              isPaused: _isPaused,
            ),
          ),
        )
      ),      
    );
  }
}