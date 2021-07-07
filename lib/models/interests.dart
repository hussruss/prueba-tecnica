import 'package:prueba_tecnica_flutter/utils/enums.dart';

///
///
///Modelo para el manejo de cada item
class Interest {
  int _id;
  String _name;
  InterestType _type;
  SubTypes _subType;

  Interest({
    int id,
    String name,
    InterestType type,
    SubTypes subType,
  }) {
    this._id = id;
    this._name = name;
    this._type = type;
    this._subType = subType;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  InterestType get type => _type;
  set type(InterestType type) => _type = type;
  SubTypes get subType => _subType;
  set subType(SubTypes subType) => _subType = subType;

  @override
  String toString() {
    return '''Interest{ 
      _id : $_id
      _name: $_name
      _type: $_type
      subType: $_subType
      ''';
  }
}
