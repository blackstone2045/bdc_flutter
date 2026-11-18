class Task {
  final String id;
  final String title;
  final String description;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });
}
