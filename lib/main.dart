import 'package:flutter/material.dart';
import 'package:hedieaty/views/login_page.dart';
import 'package:hedieaty/views/main_screen.dart';

void main() {
  runApp(HedieatyApp());
}

class HedieatyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hedieaty',
      home: LoginScreen(),
    );
  }
}
