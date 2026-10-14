import 'OOP/product.dart';

Future<void> main() async {
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
  // confirmOrder(name: "Burger", id: 5352632, qnty: 2);

  // Vehical vehical = Vehical();
  // vehical.drive();

  // EvCar evCar = EvCar();

  // evCar.recharge();

  // print('Loading...');

  // String name = await fetchUser();

  // print(name);

  // addProduct();
  divide(10, 0);
}

// void confirmOrder({required String name, required int id, required int qnty}) {
//   print("Your Order id: $id");
//   print("Your $qnty $name Order is confirmed");
// }

Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Refat';
}

Future<Product> addProduct() async {
  Product product = Product(name: "Food", price: 200, qnty: 2);
  try {
    print("adding product....");
    Future.delayed(Duration(seconds: 5));
    print("You Added: $product.name");
  } catch (e) {
    throw e;
  }
  return product;
}

void divide(int a, int b) {
  try {
    print(a ~/ b);
  } catch (e) {
    print('Something went wrong: $e');
  } finally {
    print('Finished');
  }
}
