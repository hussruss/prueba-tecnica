part of 'interests_bloc.dart';

///InterestsEvent
///
///Clase para el maejo de evntos de los items
class InterestsEvent extends Equatable {
  InterestsEvent();

  @override
  List<Object> get props => [];
}

///Evento disparador para términos y condiciones
class AddItem extends InterestsEvent {
  final Interest interests;

  AddItem({this.interests});
  @override
  List<Object> get props => [interests];
  

  @override
  String toString() => 'AddItem {interes: $interests,}';
}

///Evento disparador para términos y condiciones
class DeleteItem extends InterestsEvent {
  final Interest interests;

  DeleteItem({this.interests});
  @override
  List<Object> get props => [interests];
  

  @override
  String toString() => 'DeleteItem {interes: $interests,}';
}

class SelectAllItems extends InterestsEvent {
  final InterestType type;

  SelectAllItems({this.type});
  @override
  List<Object> get props => [type];
  

  @override
  String toString() => 'SelectAllItems {type: $type,}';
}



class UnselectAllItems extends InterestsEvent {
  final InterestType type;

  UnselectAllItems({this.type});
  @override
  List<Object> get props => [type];
  

  @override
  String toString() => 'UnselectItem {type: $type,}';
}
