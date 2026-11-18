
import '../../domain/entities/geo.dart';

class GeoModel extends Geo {
  const GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json['lat'], lng: json['lng']);
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}
