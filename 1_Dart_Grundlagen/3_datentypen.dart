
void main()
{
  int alter = 32;           // Integer

  double mainDouble = 4.4;  // Double

  bool meinBool = false;    // Bool
  

  // ######################################

  String meinString ="Der Ball";

  String zweitenString = " ist rot.";

  String verkettet = meinString + zweitenString;

  print(verkettet);

  print(meinString + zweitenString);

  print(meinString + " ist blau");

  String multiline = ''' das
  ist
  ein
  String
  ''';

  print (multiline);

  int wert = 3;

  String beispiel = "Der Wert ist: $wert";

  print (beispiel);

  // ! Statisch
  int alter1 = 32;           // Integer

  double mainDouble1 = 4.4;  // Double

  bool meinBool1 = false;    // Bool
  
  String meinString1 ="Der Ball";

  // ! Automatisch
  var alter2 = 32;          // Integer

  var mainDouble2 = 4.4;    // Double

  var meinBool2 = false;    // Bool
  
  var meinString2 ="Der Ball";


  // ! Dynamic
  dynamic variable3;
  variable3 = 3;

  variable3 = "string";




}