import 'package:animations/screens/home/home_screen.dart';
import 'package:animations/widgets/form_container.dart';
import 'package:animations/widgets/signup_button.dart';
import 'package:animations/widgets/stagger_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 2)
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Deixar as animções 4x mais lentas para análises
    //timeDilation = 4;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover
          )
        ),
        //Colocar um ListView para que quando o teclado virtual for aberto ao digiar
        // usuário e senha, seja possível rolar a tela atrás sem que encubra a tela
        // sem a possibilidade de visualizar a informação atras.
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset(
                        "images/tickicon.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignUpButton()
                  ],
                ),
                StaggerAnimtaion(
                  controller: _animationController.view
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}