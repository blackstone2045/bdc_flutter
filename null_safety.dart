import 'dart:io';

void main() {
  print("Enter Your Name: ");

  String name = stdin.readLineSync()!;
  print(name);

  int age = int.parse(stdin.readLineSync()!);
}
