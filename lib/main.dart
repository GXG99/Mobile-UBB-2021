import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trivia_game/bloc/domain_bloc_provider.dart';
import 'package:trivia_game/screens/update_screen.dart';
import 'bloc/domain_bloc.dart';
import 'screens/atlas_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/menu_screen.dart';

void main() => runApp(TriviaGame());

class TriviaGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DomainBlocProvider<DomainBloc>(
      bloc: DomainBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => AtlasScreen(),
          '/atlas': (context) => AtlasScreen(),
        },
      ),
    );
  }
}
