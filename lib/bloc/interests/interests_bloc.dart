import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_flutter/models/interests.dart';
import 'package:prueba_tecnica_flutter/utils/enums.dart';
import 'package:prueba_tecnica_flutter/utils/fake_data.dart';

part 'interests_event.dart';
part 'interests_state.dart';

///InterestsBloc
///
///[bloc] para control de estado de la pantalla Interests a
///través del estado [InterestsState] y eventos [InterestsEvent]
class InterestsBloc extends Bloc<InterestsEvent, InterestsState> {
  InterestsBloc() : super(InterestsState.initial());

  //InterestsState get initialState => Uninitialized();
  @override
  Stream<InterestsState> mapEventToState(InterestsEvent event) async* {
    if (event is AddItem) {
      yield* _addItem(
        interest: event.interests,
      );
    }
    if (event is DeleteItem) {
      yield* _deleteItem(
        interest: event.interests,
      );
    }
    if (event is SelectAllItems) {
      yield* _selectAllItems(
        type: event.type,
      );
    }
    if (event is UnselectAllItems) {
      yield* _unselectAllItems(
        type: event.type,
      );
    }
  }

  /// _addItem.
  ///
  /// Agregar el interes al estado.
  Stream<InterestsState> _addItem({Interest interest}) async* {
    try {
      switch (interest.type) {
        case InterestType.SPORT:
          yield state
              .copyWith(sportsInterests: [interest, ...state.sportsInterests]);
          break;
        case InterestType.MUSIC:
          yield state
              .copyWith(musicInterests: [interest, ...state.musicInterests]);
          break;
        case InterestType.FOOD:
          yield state
              .copyWith(foodInterests: [interest, ...state.foodInterests]);
          break;
        default:
      }
    } catch (e) {
      print("Error: $e");
      //Controlar error
    }
  }

  /// _deleteItem.
  ///
  /// Elimina el item de tipo del interes.
  Stream<InterestsState> _deleteItem({Interest interest}) async* {
    try {
      switch (interest.type) {
        case InterestType.SPORT:
         
          yield state.copyWith(
              sportsInterests: state.sportsInterests
                  .where((item) => item != interest)
                  .toList());
          break;
        case InterestType.MUSIC:
          yield state.copyWith(
              musicInterests: state.musicInterests
                  .where((item) => item != interest)
                  .toList());
          break;
        case InterestType.FOOD:
          yield state.copyWith(
              foodInterests: state.foodInterests
                  .where((item) => item != interest)
                  .toList());
          break;
        default:
      }
    } catch (e) {
      print("Error: $e");
      //Controlar error
    }
  }

  /// _selectAllItems.
  ///
  /// Selecciona todos los item del tipo del interes seleccionado.
  Stream<InterestsState> _selectAllItems({InterestType type}) async* {
    try {
      switch (type) {
        case InterestType.SPORT:
          yield state.copyWith(sportsInterests: sportFakeData);
          break;
        case InterestType.MUSIC:
          yield state.copyWith(musicInterests: musicFakeData);
          break;
        case InterestType.FOOD:
          yield state.copyWith(foodInterests: foodFakeData);
          break;
        default:
      }
    } catch (e) {
      print("Error: $e");
      //Controlar error
    }
  }

  /// _unselectAllItems.
  ///
  /// Un todos los item del tipo del interes seleccionado.
  Stream<InterestsState> _unselectAllItems({InterestType type}) async* {
    try {
      switch (type) {
        case InterestType.SPORT:
          yield state.copyWith(sportsInterests: []);
          break;
        case InterestType.MUSIC:
          yield state.copyWith(musicInterests: []);
          break;
        case InterestType.FOOD:
          yield state.copyWith(foodInterests: []);
          break;
        default:
      }
    } catch (e) {
      print("Error: $e");
      //Controlar error
    }
  }
}
