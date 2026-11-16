import '../entities/subscription_plan.dart';
import '../repositories/subscription_domain_repository.dart';

class GetSubscriptionPlansUseCase {
  final SubscriptionDomainRepository repository;

  GetSubscriptionPlansUseCase({required this.repository});

  Future<List<SubscriptionPlan>> execute() async {
    return await repository.getSubscriptionPlans();
  }
}
