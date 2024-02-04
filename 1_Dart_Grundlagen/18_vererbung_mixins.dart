
void main () {

  Student student1 = Student();

  student1.setStudienjahr = 2;
  int studienjahr = student1.getStudienjahr;
  print (studienjahr);

  student1.feiern();

  student1.setName = "Patrick";

  student1.lernen();



}

class Person {

  late String _name;

  late int _alter;


  // getter
  String get getName => this._name;
  int get getAlter => this._alter;

  // setter
  set setName(String name) {
    this._name = name;
  }
  set setAlter(int alter) {
    this._alter = alter;
  }

  // methoden
  void laufen() {
    print("Person läuft");
  }
}

mixin lernender {
  void lernen() {
    print("Lernen");
  }
}

class Student extends Person with lernender {

  late int _studienjahr;

  // getter
  int get getStudienjahr => this._studienjahr;

  // setter
  set setStudienjahr(int studienjahr) {
    this._studienjahr = studienjahr;
  }

  // methoden
  void feiern() {
    print ("feiern");
  }
}