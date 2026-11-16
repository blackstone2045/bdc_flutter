import '../../domain/entities/subscription_plan.dart';
import '../../domain/repositories/subscription_domain_repository.dart';
import '../data_sources/subscription_mock_data_source.dart';

class SubscriptionDataRepository implements SubscriptionDomainRepository {
  final SubscriptionDataSource dataSource;

  SubscriptionDataRepository({required this.dataSource});

  @override
  Future<List<SubscriptionPlan>> getSubscriptionPlans() async {
    return await dataSource.getSubscriptionPlans();
  }
}
