import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter/bloc/interests/interests_bloc.dart';
import 'package:prueba_tecnica_flutter/models/interests.dart';
import 'package:prueba_tecnica_flutter/ui/widgets/iterests_item.dart';
import 'package:prueba_tecnica_flutter/utils/enums.dart';


//Vista del slider de interese
class InterestedViewer extends StatefulWidget {
  final List<Interest> data;
  final InterestType type;
  final List<Interest> state;
  InterestedViewer({Key key, this.data, this.type, this.state})
      : super(key: key);

  @override
  _InterestedViewerState createState() => _InterestedViewerState();
}

class _InterestedViewerState extends State<InterestedViewer> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    _checked = widget.data.length == widget.state.length;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Text("Selecciona las que más te gusten")),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Selecionar todo"),
                              Checkbox(
                                  value: _checked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _checked = value;
                                    });
                                    if (_checked)
                                      BlocProvider.of<InterestsBloc>(context)
                                        ..add(
                                            SelectAllItems(type: widget.type));
                                    if (!_checked)
                                      BlocProvider.of<InterestsBloc>(context)
                                        ..add(UnselectAllItems(
                                            type: widget.type));
                                  })
                            ],
                          ),
                        ),
                        Container(
                          height: 400,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 0,
                              ),
                              primary: false,
                              itemCount: widget.data.length,
                              itemBuilder: (context, index) {
                                return InterestItem(
                                    interest: widget.data[index],
                                    isSelected: widget.state
                                        .contains(widget.data[index]));
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InterestedViewerSubtypes extends StatefulWidget {
  final List<Interest> data;
  final InterestType type;
  final List<Interest> state;
  final List<SubTypes> subtypes;
  InterestedViewerSubtypes(
      {Key key, this.data, this.type, this.state, this.subtypes})
      : super(key: key);

  @override
  _InterestedViewerSubtypesState createState() =>
      _InterestedViewerSubtypesState();
}

class _InterestedViewerSubtypesState extends State<InterestedViewerSubtypes> {
  bool _checked = false;
  int _numPages = 1;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Interest> data;

  ///Actualiza el indicador de pagina
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    List<String> titles = ["Comida rápida", "Mexicana", "Oriental", "Postres"];
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
          height: 20.0,
          width: 80,
          decoration: BoxDecoration(
              color: isActive ? Color(0xFF9e2273) : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(2))),
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

  @override
  Widget build(BuildContext context) {
    _checked = widget.data.length == widget.state.length;
    _numPages = widget.subtypes.length;
    data = widget.data;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Text("Selecciona las que más te gusten")),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Selecionar todo"),
                              Checkbox(
                                  value: _checked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _checked = value;
                                    });
                                    if (_checked)
                                      BlocProvider.of<InterestsBloc>(context)
                                        ..add(
                                            SelectAllItems(type: widget.type));
                                    if (!_checked)
                                      BlocProvider.of<InterestsBloc>(context)
                                        ..add(UnselectAllItems(
                                            type: widget.type));
                                  })
                            ],
                          ),
                        ),
                        Container(
                            height: 100,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: _buildPageIndicator(),
                            )),
                        Container(
                            height: 300,
                            child: PageView(
                                physics: ClampingScrollPhysics(),
                                controller: _pageController,
                                onPageChanged: (int page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                children: [
                                  _buildSubType(widget.data
                                      .where((item) =>
                                          item.subType == SubTypes.FASTFOOD)
                                      .toList()),
                                  _buildSubType(widget.data
                                      .where((item) =>
                                          item.subType == SubTypes.MEXICAN)
                                      .toList()),
                                  _buildSubType(widget.data
                                      .where((item) =>
                                          item.subType == SubTypes.ORIENTAL)
                                      .toList()),
                                  _buildSubType(widget.data
                                      .where((item) =>
                                          item.subType == SubTypes.SWEET)
                                      .toList()),
                                ])),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildSubType(List<Interest> data) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 0,
          ),
          primary: false,
          itemCount: data.length,
          itemBuilder: (context, index) {
            print("ata[index].type ==> ${data[index].subType}");

            return Container(
                child: InterestItem(
                    interest: data[index],
                    isSelected: widget.state.contains(data[index])));
          }),
    );
  }
}
