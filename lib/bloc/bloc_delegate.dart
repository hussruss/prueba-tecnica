
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

///SimpleBlocDelegate
///
class SimpleBlocDelegate extends BlocObserver {
  @override
  // ignore: must_call_super
  void onEvent(Bloc bloc, Object event) {
    print('Bloc: ${bloc.runtimeType}, event: $event');

  }

  @override
  // ignore: must_call_super
  void onTransition(Bloc bloc, Transition transition) {
    print('Bloc: ${bloc.runtimeType}, Transition: $transition');

  }

  @override
  // ignore: must_call_super
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(
        'Bloc: ${bloc.runtimeType}, event: $error, stackTrace: $stackTrace');
  }
}
