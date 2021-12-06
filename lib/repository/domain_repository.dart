import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trivia_game/domain/domain.dart';

class DomainRepository extends ChangeNotifier {
  List<Domain> domains = [];

  DomainRepository() {
    for (int i = 0; i < 13; ++i) {
      final domain = Domain(title: 'Title $i', description: 'Description $i');
      domain.id = i;
      domains.add(domain);
    }
  }

  List<Domain> getDomains() {
    return domains;
  }

  int getLength() {
    return domains.length;
  }

  Domain getDomainById(int id) {
    return domains.where((domain) => domain.id == id).first;
  }

  void addDomain(Domain domain) {
    var id = domains
        .map((e) => e.id)
        .reduce((value, element) => max(value, element));
    id++;
    domain.id = id;
    domains.add(domain);
    notifyListeners();
  }

  void removeDomain(int id) {
    domains.removeWhere((domain) => domain.id == id);
    notifyListeners();
  }

  void updateDomain(Domain domain) {
    for (int i = 0; i < domains.length; ++i) {
      if (domain.id == domains[i].id) {
        domains[i] = domain;
      }
    }
  }
}
