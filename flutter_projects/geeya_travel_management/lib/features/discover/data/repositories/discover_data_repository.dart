import '../../domain/entities/destination.dart';
import '../../domain/repositories/discover_domain_repository.dart';
import '../data_sources/discover_mock_data_source.dart';

class DiscoverDataRepository implements DiscoverDomainRepository {
  final DiscoverDataSource dataSource;

  DiscoverDataRepository({required this.dataSource});

  @override
  Future<List<Destination>> getDestinations() async {
    return await dataSource.getDestinations();
  }
}
