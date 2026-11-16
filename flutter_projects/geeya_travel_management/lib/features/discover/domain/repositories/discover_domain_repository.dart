import '../entities/destination.dart';

abstract class DiscoverDomainRepository {
  Future<List<Destination>> getDestinations();
}
