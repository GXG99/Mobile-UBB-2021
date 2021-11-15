import 'dart:ui';
import 'package:flutter/material.dart';
import 'screens/atlas_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/menu_screen.dart';

void main() => runApp(TriviaGame());

class TriviaGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuScreen(),
        '/atlas': (context) => const AtlasScreen(),
      },
    );
  }
}
