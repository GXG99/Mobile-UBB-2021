import 'dart:async';

import 'package:trivia_game/bloc/bloc.dart';
import 'package:trivia_game/domain/domain.dart';
import 'package:trivia_game/repository/domain_repository.dart';

class DomainBloc implements AbstractBloc {
  final _controller = StreamController<List<Domain>>();
  DomainRepository _domainRepository = DomainRepository();

  Stream<List<Domain>> domainStream() {
    final domainList = _domainRepository.getDomains();
    _controller.sink.add(domainList);
    return _controller.stream;
  }

  void deleteDomain(int id) {
    _domainRepository.removeDomain(id);
  }

  Domain getDomainById(int id) {
    return _domainRepository.getDomainById(id);
  }

  void updateDomain(Domain domain) {
    _domainRepository.updateDomain(domain);
    _controller.sink.add(_domainRepository.getDomains());
  }

  void addDomain(Domain domain) {
    _domainRepository.addDomain(domain);
    _controller.sink.add(_domainRepository.getDomains());
  }

  @override
  void dispose() {
    _controller.close();
  }
}
