import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_game/components/menu_buttons.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('images/profile_picture.jpg'),
            radius: 50,
          ),
          Text(
            'Profile name',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 100,
            endIndent: 100,
            color: Colors.grey,
          ),
          const MenuButtons(),
        ],
      ),
    );
  }
}
