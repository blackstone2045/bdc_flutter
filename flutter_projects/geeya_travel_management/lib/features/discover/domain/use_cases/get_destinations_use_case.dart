import '../entities/destination.dart';
import '../repositories/discover_domain_repository.dart';

class GetDestinationsUseCase {
  final DiscoverDomainRepository repository;

  GetDestinationsUseCase({required this.repository});

  Future<List<Destination>> execute() async {
    return await repository.getDestinations();
  }
}
