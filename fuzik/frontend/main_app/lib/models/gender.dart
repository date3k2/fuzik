enum Gender {
  male(0),
  female(1),
  other(2);

  final int _number;

  const Gender(this._number);

  int get toInt => _number;
}