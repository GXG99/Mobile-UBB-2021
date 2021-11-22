import 'package:flutter/cupertino.dart';
import 'package:trivia_game/bloc/bloc.dart';
import 'package:trivia_game/bloc/domain_bloc.dart';

class DomainBlocProvider<T extends AbstractBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const DomainBlocProvider({Key key, this.child, this.bloc}) : super(key: key);

  static T of<T extends AbstractBloc>(BuildContext context) {
    final DomainBlocProvider<T> provider =
        context.findAncestorWidgetOfExactType();
    return provider.bloc;
  }

  @override
  _DomainBlocProviderState createState() => _DomainBlocProviderState();
}

class _DomainBlocProviderState extends State<DomainBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
