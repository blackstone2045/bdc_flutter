void main() {
  Map<String, dynamic> student = {
    "name": "Rafique",
    "id": 2220085021,
    "institute": "NIET",
  };

  print(student["name"]);

  student["blood"] = 'B+';

  print(student["blood"]);
}
