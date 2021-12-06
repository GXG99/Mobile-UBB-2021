import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivia_game/bloc/domain_bloc.dart';
import 'package:trivia_game/bloc/domain_bloc_provider.dart';
import 'package:trivia_game/database/domain_database.dart';
import 'package:trivia_game/domain/domain.dart';

class UpdateScreen extends StatefulWidget {
  int id;
  VoidCallback refreshList;

  UpdateScreen(this.id, this.refreshList, {Key key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController domainTitleController = TextEditingController();

  TextEditingController domainDescriptionController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    readDomain();
  }

  Future readDomain() async {
    setState(() {
      isLoading = true;
    });

    domain = await DomainDatabase.instance.readDomain(widget.id);

    setState(() {
      isLoading = false;
    });
  }

  Domain domain;

  @override
  Widget build(BuildContext context) {
    if (domain != null) {
      domainTitleController.text = domain.title;
      domainDescriptionController.text = domain.description;
    }
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
                    domain.id = widget.id;
                    DomainDatabase.instance.update(domain);
                    // DomainBlocProvider.of<DomainBloc>(context)
                    //     .updateDomain(domain);
                    widget.refreshList();
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
