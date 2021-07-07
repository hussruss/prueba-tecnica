import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter/bloc/interests/interests_bloc.dart';

//Pantalla donde se muestra los intereses seleccionados previamente
class SavingSvreen extends StatelessWidget {
  const SavingSvreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HOla");
    return Scaffold(
      body: BlocConsumer<InterestsBloc, InterestsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                          text: "Estos son tus temas de interes",
                          style: TextStyle(color: Color(0xFF9e2273)))),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Deportes",
                            style: TextStyle(color: Color(0xFF9e2273))),
                      ),
                      Column(
                          children: state.sportsInterests
                              .map((e) => Container(
                                  child: Center(child: Text("${e.name}"))))
                              .toList()),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Música",
                            style: TextStyle(color: Color(0xFF9e2273))),
                      ),
                      Column(
                          children: state.musicInterests
                              .map((e) => Container(
                                  child: Center(child: Text("${e.name}"))))
                              .toList()),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Comida",
                            style: TextStyle(color: Color(0xFF9e2273))),
                      ),
                      Column(
                          children: state.foodInterests
                              .map((e) => Container(
                                  child: Center(child: Text("${e.name}"))))
                              .toList()),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
