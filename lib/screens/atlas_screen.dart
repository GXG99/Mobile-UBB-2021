import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivia_game/components/domain_card.dart';
import 'package:trivia_game/domain/domain.dart';

class AtlasScreen extends StatefulWidget {
  const AtlasScreen({Key? key}) : super(key: key);

  @override
  _AtlasScreenState createState() => _AtlasScreenState();
}

class _AtlasScreenState extends State<AtlasScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void controller(DomainCard DomainCard, String action) {}
  List<Widget> domainCards = <Widget>[
    DomainCard(
      domain: Domain(title: "Informatica", description: "Descriere"),
    ),
    DomainCard(
      domain: Domain(title: "Medicină", description: "Descriere"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atlas'),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: ListView(
              children: domainCards,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.book),
                  hintText: 'Domain title',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: FaIcon(FontAwesomeIcons.info),
                  ),
                  hintText: 'Domain description',
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    Domain domain = Domain(
                        title: titleController.text,
                        description: descriptionController.text);
                    domainCards.add(
                      DomainCard(
                        domain: domain,
                      ),
                    );
                  }
                  titleController.clear();
                  descriptionController.clear();
                });
              },
              child: const Text(
                'Add domain',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade300),
            ),
          )
        ],
      ),
    );
  }
}
