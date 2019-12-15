class Docket {
  final String name;
  bool isDone;

  Docket({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
