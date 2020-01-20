import 'package:animations/widgets/input_field.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hint: "UserName",
              obscure: false,
              icon: Icons.person_outline,
            ),
            InputField(
              hint: "Password",
              obscure: true,
              icon: Icons.lock_outline,
            )
          ],
        ),
      ),
    );
  }
}