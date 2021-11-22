import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivia_game/bloc/domain_bloc.dart';
import 'package:trivia_game/bloc/domain_bloc_provider.dart';
import 'package:trivia_game/components/domain_card.dart';
import 'package:trivia_game/domain/domain.dart';
import 'package:flutter/src/widgets/dismissible.dart';

class AtlasScreen extends StatefulWidget {
  @override
  _AtlasScreenState createState() => _AtlasScreenState();
}

class _AtlasScreenState extends State<AtlasScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void controller(DomainCard DomainCard, String action) {}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Domain>>(
      stream: DomainBlocProvider.of<DomainBloc>(context).domainStream(),
      builder: (context, snapshot) {
        final domains = snapshot.data;
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
                child: createList(domains),
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
                        DomainBlocProvider.of<DomainBloc>(context)
                            .addDomain(domain);
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
      },
    );
  }

  Widget createList(List<Domain> domains) {
    return ListView.builder(
      itemCount: domains.length,
      itemBuilder: (BuildContext context, int position) {
        return createItem(domains[position]);
      },
    );
  }

  Widget createItem(Domain domain) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        DomainBlocProvider.of<DomainBloc>(context).deleteDomain(domain.id);
      },
      confirmDismiss: confirmDelete,
      child: createCard(domain),
    );
  }

  Future<bool> confirmDelete(DismissDirection direction) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Deleting"),
            content: const Text("Are you sure you want to delete this domain?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("YES"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("NO"),
              ),
            ],
          );
        });
  }

  Widget createCard(Domain domain) {
    return DomainCard(domain: domain);
  }
}
