class SubscriptionPlan {
  final String id;
  final String name;
  final String price;
  final String period;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.price,
    required this.period,
    required this.features,
    this.isPopular = false,
  });
}
