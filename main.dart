import 'Class/sompod_hisab.dart';
import 'Class/student.dart';

void main() {
  //Student class test without nullsafety
  // Student student = Student("Rafi", 2220085021, "CST", "22-23");
  // student.isLogedin = true;
  // if (student.isLogedin) {
  //   print(student.name);
  //   print(student.id);
  //   print(student.department);
  //   print(student.session);
  // } else {
  //   print("You are not Loged in");
  // }

  // Department department = Department(
  //   name: "CST",
  //   seats: 20,
  //   session: "2022-2023",
  // );
  // department.session = "";

  // Ami().landUse();
  confirmOrder(name: "Burger", id: 5352632, qnty: 2);
}

void confirmOrder({required String name, required int id, required int qnty}) {
  print("Your Order id: $id");
  print("Your $qnty $name Order is confirmed");
}
