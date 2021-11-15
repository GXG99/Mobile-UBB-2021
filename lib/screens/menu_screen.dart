import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Start joc',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/atlas');
                  },
                  child: const Text(
                    'Atlas',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Iesire',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade300),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
