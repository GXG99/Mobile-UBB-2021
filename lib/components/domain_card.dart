import 'package:flutter/material.dart';
import 'package:trivia_game/domain/domain.dart';
import 'package:trivia_game/screens/update_screen.dart';

class DomainCard extends StatelessWidget {
  final Domain domain;

  VoidCallback refreshCallback;

  DomainCard({this.domain, this.refreshCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(domain.id.toString()),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade300,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Image(
              image: AssetImage('images/books.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  domain.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                  indent: 50,
                  endIndent: 50,
                ),
                Text(
                  domain.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateScreen(domain.id, refreshCallback),
                          ),
                        );
                      },
                      child: Text(
                        'EDIT',
                        style: TextStyle(color: Colors.deepPurple.shade300),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
