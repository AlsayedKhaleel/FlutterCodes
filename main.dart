void main() {
//   print("Hello, Dart!!!");

//   var name1 = 'Alsayed';
//   var name2 = "Ali";
//   var name3 = """Khaleel""";

//   /// This is a top-level Function.
//   print(name1 + ' ' + name2 + ' ' + name3);
//   print('==================');

//   print("""
// My Name is: ${name1}
// My Father's: ${name2}
// My Grandpa's: ${name3}
// """);

  // String result = greating();
  // print(result);

  // var t = 'Alsayed';
  // print(t.runtimeType);
  // t = 1000;
  // print(t);
  // print(t.runtimeType);

  // String? name;
  // print(name?.isEmpty);

  // greating(10, "Alsayed", 123.133);
  // f(v2: "Alsayed");

  // List numbers = [1, 2, 3, 4, 5];

  // numbers.forEach((number) => print(++number));

  // print(numbers);

  // List<dynamic> ints;

  // ints = [1, 2, "alsa"];

  // List Strings = <dynamic> [];

  // Strings.add("Alsayed");
  // Strings.add(1);
  // Function f1 = f;
  // f1();

  Man m1 = Man();
  m1.movef();

}


// class Doctor extends Man {

// }

class Man {

  void movef() {
    print("I'm moving forward!!");
  }

  void moveb() {
    print("I'm moving backwork!!");
  }
}


f({v1, v2, v3}) {
  print("What is up, Alsayed");
}
/// Greating the users.
greating(v1, v2, v3) {
  print(v1);
  print(v2);
  print(v3);
  print("Hello, There!!");
  return "X";
}
