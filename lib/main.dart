import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter/bloc/bloc_delegate.dart';
import 'package:prueba_tecnica_flutter/bloc/interests/interests_bloc.dart';
import 'package:prueba_tecnica_flutter/ui/screens/interests_screen.dart';
import 'package:prueba_tecnica_flutter/ui/screens/saving_screen.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  final _interestsBloc = InterestsBloc();

  runApp(App(interestsBloc: _interestsBloc));
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  final InterestsBloc interestsBloc;
  const App({
    this.interestsBloc,
  });
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
            providers: [
              
              
              BlocProvider<InterestsBloc>(
                  create: (context) => InterestsBloc(
              )),
            ],
            child:MaterialApp(
      title: 'Itereses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      routes: <String, WidgetBuilder> {
      '/home': (BuildContext context) => InterestsScreen(),
      '/saving': (BuildContext context) => SavingSvreen(),
    },
      home: InterestsScreen(),
    ));
  }
}
