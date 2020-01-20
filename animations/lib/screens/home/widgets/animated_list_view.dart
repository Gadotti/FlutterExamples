import 'package:animations/screens/home/widgets/list_data.dart';
import 'package:flutter/material.dart';

class AnimatedListView extends StatelessWidget {

  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter",
          subtitle: "Com o curso da Udemy",
          image: AssetImage("images/avatar2.png"),          
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: "Estudar Flutter 2",
          subtitle: "Com o curso da Udemy",
          image: AssetImage("images/avatar2.png"),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: "Estudar Flutter 3",
          subtitle: "Com o curso da Udemy",
          image: AssetImage("images/avatar2.png"),
          margin: listSlidePosition.value * 0,
        )
      ],
    );
  }
}