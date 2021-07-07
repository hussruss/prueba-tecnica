import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter/bloc/interests/interests_bloc.dart';

import 'package:prueba_tecnica_flutter/ui/widgets/iterests_viewer.dart';
import 'package:prueba_tecnica_flutter/utils/enums.dart';
import 'package:prueba_tecnica_flutter/utils/fake_data.dart';

//Pantalla que renderiza los intereses
class InterestsScreen extends StatefulWidget {
  InterestsScreen({Key key}) : super(key: key);

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _goToLogin() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          _buildTitle(),
          Container(
            child: Align(
              alignment: FractionalOffset(1, .88),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator()),
            ),
          ),
          _buildInterestsView(height),
          _buildButton()
        ],
      ),
    );
  }

  //Titulo
  Container _buildTitle() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text("Cuentanos tus intereses", style: TextStyle(fontSize: 25)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "Ayudanos a darte un mejor servicio y cuentanos qué es lo que más te gusta"),
          )
        ],
      ),
    );
  }

  ///Vista
  Widget _buildInterestsView(double height) {
    return BlocConsumer<InterestsBloc, InterestsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(children: [
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * .6,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        InterestedViewer(
                            data: sportFakeData,
                            type: InterestType.SPORT,
                            state: state.sportsInterests),
                        InterestedViewer(
                            data: musicFakeData,
                            type: InterestType.MUSIC,
                            state: state.musicInterests),
                        InterestedViewerSubtypes(
                          data: foodFakeData,
                          type: InterestType.FOOD,
                          state: state.foodInterests,
                          subtypes: [
                            SubTypes.FASTFOOD,
                            SubTypes.MEXICAN,
                            SubTypes.ORIENTAL,
                            SubTypes.SWEET
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

  ///BoxDecoration
  BlocConsumer _buildButton() {
    return BlocConsumer<InterestsBloc, InterestsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final bool isvalid = state.sportsInterests.length > 0 ||
            state.musicInterests.length > 0 ||
            state.foodInterests.length > 0;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: RaisedButton(
              onPressed: isvalid
                  ? () {
                      Navigator.pushNamed(context, "/saving");
                    }
                  : null,
              elevation: 6.0,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Color(0xFFCC3697),
              child: Text(
                "Guardar",
                style: TextStyle(
                  color: isvalid ? Color(0xFFD3D3D3) : Color(0xFFF3F1F2),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///Actualiza el indicador de pagina
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    List<String> titles = ["Deportes", "Musica", "Comida"];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? _indicator(true, titles[i], i)
          : _indicator(false, titles[i], i));
    }
    return list;
  }

  /// Indicador de pagina
  Widget _indicator(bool isActive, String text, int index) {
    return GestureDetector(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          height: 20.0,
          width: 80,
          decoration: BoxDecoration(
              color: isActive ? Color(0xFF9e2273) : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: isActive ? Color(0xFFFFFFFF) : Color(0xFF9e2273)),
          ))),
      onTap: () {
        setState(() {
          WidgetsBinding.instance.addPostFrameCallback((_) =>
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease));
        });
      },
    );
  }
}
