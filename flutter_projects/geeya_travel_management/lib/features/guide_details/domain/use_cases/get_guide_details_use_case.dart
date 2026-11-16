import '../entities/guide_details.dart';
import '../repositories/guide_details_domain_repository.dart';

class GetGuideDetailsUseCase {
  final GuideDetailsDomainRepository repository;

  GetGuideDetailsUseCase({required this.repository});

  Future<GuideDetails> execute(String cityId) async {
    return await repository.getGuideDetails(cityId);
  }
}
