import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivia_game/bloc/domain_bloc.dart';
import 'package:trivia_game/bloc/domain_bloc_provider.dart';
import 'package:trivia_game/database/domain_database.dart';
import 'package:trivia_game/domain/domain.dart';

class AddScreen extends StatelessWidget {
  TextEditingController domainTitleController = TextEditingController();
  TextEditingController domainDescriptionController = TextEditingController();

  VoidCallback refreshListCallback;

  AddScreen(this.refreshListCallback, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new element'),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: domainTitleController,
              decoration: const InputDecoration(
                hintText: "Domain Title",
                icon: FaIcon(
                  FontAwesomeIcons.book,
                  size: 30,
                ),
              ),
            ),
            TextField(
              controller: domainDescriptionController,
              decoration: const InputDecoration(
                hintText: "Domain Description",
                icon: Padding(
                  padding: EdgeInsets.only(right: 13.0),
                  child: FaIcon(
                    FontAwesomeIcons.info,
                    size: 30,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (domainTitleController.text.isNotEmpty &&
                    domainDescriptionController.text.isNotEmpty) {
                  Domain domain = Domain(
                      title: domainTitleController.text,
                      description: domainDescriptionController.text);
                  // DomainBlocProvider.of<DomainBloc>(context).addDomain(domain);
                  DomainDatabase.instance.create(domain);
                  Navigator.of(context).pop();
                  refreshListCallback();
                } else {
                  Fluttertoast.showToast(
                      msg: "Fields cannot be empty",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade300),
              child: const Text(
                "ADD",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
