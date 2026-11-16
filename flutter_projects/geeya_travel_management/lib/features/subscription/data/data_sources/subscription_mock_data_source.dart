import '../models/subscription_plan_model.dart';

abstract class SubscriptionDataSource {
  Future<List<SubscriptionPlanModel>> getSubscriptionPlans();
}

class SubscriptionMockDataSource implements SubscriptionDataSource {
  @override
  Future<List<SubscriptionPlanModel>> getSubscriptionPlans() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      SubscriptionPlanModel(
        id: '1',
        name: 'Monthly',
        price: '\$9.99',
        period: 'per month',
        features: ['Unlimited itineraries', 'Offline access', 'Ad-free experience'],
      ),
      SubscriptionPlanModel(
        id: '2',
        name: 'Yearly',
        price: '\$89.99',
        period: 'per year',
        features: ['Unlimited itineraries', 'Offline access', 'Ad-free experience', 'Priority support'],
        isPopular: true,
      ),
    ];
  }
}
