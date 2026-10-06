class Student {
  String name;
  int id;
  String department, session;
  bool isLogedin;

  Student(
    this.name,
    this.id,
    this.department,
    this.session, {
    this.isLogedin = false,
  });
}





class Department {
  String name, session;
  int seats;

  Department({required this.name,required this.seats,required this.session});
}
