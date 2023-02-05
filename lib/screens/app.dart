import 'package:car_rent_app/constant.dart';
import 'package:car_rent_app/login.dart';
import 'package:car_rent_app/screens/home.dart';
import 'package:flutter/material.dart';

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}