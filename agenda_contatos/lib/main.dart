import 'package:agenda_contatos/ui/contact_page.dart';
import 'package:agenda_contatos/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Agenda de contatos",
      home: HomePage(),
      //home: ContactPage(),
      debugShowCheckedModeBanner: false,
  ));
}
