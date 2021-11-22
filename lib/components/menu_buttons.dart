import 'package:flutter/material.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
