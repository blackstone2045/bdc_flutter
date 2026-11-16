import '../../domain/entities/guide_details.dart';
import '../../domain/repositories/guide_details_domain_repository.dart';
import '../data_sources/guide_details_mock_data_source.dart';

class GuideDetailsDataRepository implements GuideDetailsDomainRepository {
  final GuideDetailsDataSource dataSource;

  GuideDetailsDataRepository({required this.dataSource});

  @override
  Future<GuideDetails> getGuideDetails(String cityId) async {
    return await dataSource.getGuideDetails(cityId);
  }
}
