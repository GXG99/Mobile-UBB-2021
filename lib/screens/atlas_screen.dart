import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_game/components/domain_card.dart';
import 'package:trivia_game/database/domain_database.dart';
import 'package:trivia_game/domain/domain.dart';
import 'package:flutter/src/widgets/dismissible.dart';

import 'add_screen.dart';

class AtlasScreen extends StatefulWidget {
  @override
  _AtlasScreenState createState() => _AtlasScreenState();
}

class _AtlasScreenState extends State<AtlasScreen> {
  List<Domain> domains;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshDomains();
  }

  Future refreshDomains() async {
    setState(() {
      isLoading = true;
    });

    domains = await DomainDatabase.instance.readAllDomains();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atlas'),
        backgroundColor: Colors.deepPurple.shade300,
        actions: [
          TextButton(
            onPressed: () {
              refreshDomains();
            },
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: createList(domains),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(
                () => {
                  setState(
                    () => {
                      refreshDomains(),
                    },
                  ),
                },
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.deepPurple,
          size: 30,
        ),
      ),
    );
  }

  Widget createList(List<Domain> domains) {
    if (domains != null) {
      return ListView.builder(
        itemCount: domains.length,
        itemBuilder: (BuildContext context, int position) {
          return createItem(domains[position]);
        },
      );
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  Widget createItem(Domain domain) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        DomainDatabase.instance.delete(domain.id);
        refreshDomains();
      },
      confirmDismiss: confirmDelete,
      child: DomainCard(
        domain: domain,
        refreshCallback: () => {
          setState(
            () => {
              refreshDomains(),
            },
          ),
        },
      ),
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
}
