import 'dart:async';

import 'package:trivia_game/bloc/bloc.dart';
import 'package:trivia_game/domain/domain.dart';
import 'package:trivia_game/repository/domain_repository.dart';

class DomainBloc implements AbstractBloc {
  final _controller = StreamController<List<Domain>>();
  DomainRepository _domainRepository = DomainRepository();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
