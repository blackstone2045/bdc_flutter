import 'package:clean_architecture_new/features/users/data/models/geo_model.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}
