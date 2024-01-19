class TestUser {
  int id;
  String name;
  TestUser({this.id = 0, this.name = 'Minh'});

  @override
  String toString() {
    return '$id - $name';
  }
}
