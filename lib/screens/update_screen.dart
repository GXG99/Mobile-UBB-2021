import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivia_game/bloc/domain_bloc.dart';
import 'package:trivia_game/bloc/domain_bloc_provider.dart';
import 'package:trivia_game/domain/domain.dart';

class UpdateScreen extends StatelessWidget {
  int id;
  TextEditingController domainTitleController = TextEditingController();
  TextEditingController domainDescriptionController = TextEditingController();

  UpdateScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final domain = DomainBlocProvider.of<DomainBloc>(context).getDomainById(id);
    domainTitleController.text = domain.title;
    domainDescriptionController.text = domain.description;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update domain"),
          backgroundColor: Colors.deepPurple.shade300,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: domainTitleController,
                  decoration: const InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.book),
                  ),
                ),
                TextField(
                  controller: domainDescriptionController,
                  decoration: const InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: FaIcon(FontAwesomeIcons.info),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Domain domain = Domain(
                        title: domainTitleController.text,
                        description: domainDescriptionController.text);
                    domain.id = id;
                    DomainBlocProvider.of<DomainBloc>(context)
                        .updateDomain(domain);
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade300),
                  child: const Text(
                    "UPDATE",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
