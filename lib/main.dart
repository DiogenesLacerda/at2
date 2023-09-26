import 'package:at2/home.dart';
import 'package:at2/resultado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/resultado': (context) => const Resultado()
    },
  ));
}
