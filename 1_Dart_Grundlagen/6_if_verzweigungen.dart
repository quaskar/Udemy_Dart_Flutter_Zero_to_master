
void main() {

  int alter = 17;
  alter = alter + 1;

  print ("vor dem if");

  if (alter > 18) {
    print("Du darfst in den Film");
  } else if (alter == 17) {
    print ("Du darfst gerade noch in den Film");
  } else {
    print("Du darfst nicht in den Film");
  }

  print("nach dem if");

}