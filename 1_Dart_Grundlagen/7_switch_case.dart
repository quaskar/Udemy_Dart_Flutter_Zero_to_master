

void main() {

  int alter = 16;

  String name = "Hanz";

  print ("vor dem switch");

  switch (name) {
    case "Peter":
      print ("Ich bin Peter");
      break;
    case "Hanz":
      print("Ich bin Hanz");
      break;
    default:
      print("keine Ahnung");
  }

  print ("nach dem switch");
}