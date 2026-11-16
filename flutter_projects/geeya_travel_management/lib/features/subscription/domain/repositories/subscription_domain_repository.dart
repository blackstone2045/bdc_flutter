import '../entities/subscription_plan.dart';

abstract class SubscriptionDomainRepository {
  Future<List<SubscriptionPlan>> getSubscriptionPlans();
}
