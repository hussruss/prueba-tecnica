import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter/bloc/interests/interests_bloc.dart';
import 'package:prueba_tecnica_flutter/models/interests.dart';

//Tarjeta de cada interes
class InterestItem extends StatelessWidget {
  final Interest interest;
  final bool isSelected;
  const InterestItem({Key key, this.interest, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          height: 20.0,
          width: 80,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF9e2273) : Color(0xFFFFFFFF),
            border: Border.all(color: Color(0xFF9e2273)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
              child: Text(
            interest.name,
            style: TextStyle(
                color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF9e2273)),
          ))),
      onTap: () {
        if (isSelected) {
          BlocProvider.of<InterestsBloc>(context)
            ..add(DeleteItem(interests: interest));
        } else {
          BlocProvider.of<InterestsBloc>(context)
            ..add(AddItem(interests: interest));
        }
      },
    );
  }
}
