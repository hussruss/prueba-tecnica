part of 'interests_bloc.dart';

///InterestsState
///
///Clase principal para el manejo de estados del
///estado [InterestsState]
class InterestsState extends Equatable {
  final List<Interest> sportsInterests;
  final List<Interest> musicInterests;
  final List<Interest> foodInterests;

  InterestsState({
    this.sportsInterests,
    this.musicInterests,
    this.foodInterests,
  });

  factory InterestsState.initial() {
    return InterestsState(
      sportsInterests: [],
      musicInterests: [],
      foodInterests: [],
    );
  }

  ///Funciones adicionales: copywith -update
  InterestsState copyWith(
      {List<Interest> sportsInterests,
      List<Interest> musicInterests,
      List<Interest> foodInterests}) {
    return InterestsState(
      sportsInterests: sportsInterests ?? this.sportsInterests,
      musicInterests: musicInterests ?? this.musicInterests,
      foodInterests: foodInterests ?? this.foodInterests,
    );
  }

  @override
  List<Object> get props => [
        this.sportsInterests,
        this.musicInterests,
        this.foodInterests,
      ];

  @override
  String toString() {
    return '''
       InterestsState(
sportsInterests. $sportsInterests ,
musicInterests. $musicInterests ,
foodInterests. $foodInterests ,
        
        )
      ''';
  }
}
