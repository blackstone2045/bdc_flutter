import '../../domain/entities/subscription_plan.dart';

class SubscriptionPlanModel extends SubscriptionPlan {
  SubscriptionPlanModel({
    required super.id,
    required super.name,
    required super.price,
    required super.period,
    required super.features,
    super.isPopular,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      period: json['period'],
      features: List<String>.from(json['features']),
      isPopular: json['isPopular'] ?? false,
    );
  }
}
