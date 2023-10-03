import 'package:flutter/material.dart';
import 'package:myproject/view/screen/categories_screen.dart';
import 'package:myproject/view/screen/burgeritem.dart';
import 'package:myproject/view/screen/drinkesscreen.dart';
import 'package:myproject/view/screen/loginscreen.dart';
import 'package:myproject/view/screen/seefodescreen.dart';
import 'package:myproject/view/screen/signupscreen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: loginscreen());
  }
}
