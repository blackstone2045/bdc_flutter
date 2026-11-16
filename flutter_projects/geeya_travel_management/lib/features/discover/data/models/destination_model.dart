import '../../domain/entities/destination.dart';

class DestinationModel extends Destination {
  DestinationModel({
    required super.id,
    required super.city,
    required super.country,
    required super.imageUrl,
    required super.category,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'],
      city: json['city'],
      country: json['country'],
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}
