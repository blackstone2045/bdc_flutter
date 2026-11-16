import '../entities/guide_details.dart';

abstract class GuideDetailsDomainRepository {
  Future<GuideDetails> getGuideDetails(String cityId);
}
