import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Intro',
      debugShowCheckedModeBanner: false,
      home: LogoApp(),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );

    //Antes de criar e passar o animatio para FadeGrowAnimation, estava assim:
    //animation = Tween<double>(begin: 0, end: 300).animate(controller);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeGrowTransition(LogoWidget(), animation),
    );
  }
}

//Antes da refatoração
// class AnimatedLogo extends AnimatedWidget {

//   AnimatedLogo(Animation<double> animation) : super(listenable: animation);

//   @override
//   Widget build(BuildContext context) {

//     final Animation<double> animation = listenable;

//     return Center(
//       child: Container(
//         height: animation.value,
//         width: animation.value,
//         child: FlutterLogo(),
//       ),
//     );
//   }  
// }

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}

class FadeGrowTransition extends StatelessWidget {

  //Por ser um Stateless, é obrigatório que as variáveis abaixo sejam do tipo 'final'
  //Assim representa a conformidade da do entendimento do que é o Stateless, que só matém
  // 1 estado.
  final Widget child;
  final Animation<double> animation;
  final sizeTween = Tween<double>(begin: 0, end: 300);
  final opacityTween = Tween<double>(begin: 0.1, end: 1);

  FadeGrowTransition(this.child, this.animation);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacityTween.evaluate(animation)
              .clamp(0, 1.0),
              //O .clamp foi adicionado para evitar erro no uso de curvas que
              // extrapolam o limite da opacidade de 0 e 1, causando crash no sistema
            child: Container(
              height: sizeTween.evaluate(animation),
              width: sizeTween.evaluate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}

//Classe exemplo só para animal o tamanho da logo (de 0 para 300px)
// class GrowTransition extends StatelessWidget {

//   //Por ser um Stateless, é obrigatório que as variáveis abaixo sejam do tipo 'final'
//   //Assim representa a conformidade da do entendimento do que é o Stateless, que só matém
//   // 1 estado.
//   final Widget child;
//   final Animation<double> animation;

//   GrowTransition(this.child, this.animation);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           return Container(
//             height: animation.value,
//             width: animation.value,
//             child: child,
//           );
//         },
//         child: child,
//       ),
//     );
//   }
// }
