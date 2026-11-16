import 'package:get/get.dart';
import '../../domain/entities/subscription_plan.dart';
import '../../domain/use_cases/get_subscription_plans_use_case.dart';

class PaywallController extends GetxController {
  final GetSubscriptionPlansUseCase getPlansUseCase;

  PaywallController({required this.getPlansUseCase});

  final plans = <SubscriptionPlan>[].obs;
  final selectedPlanId = "".obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPlans();
  }

  Future<void> fetchPlans() async {
    isLoading.value = true;
    try {
      final result = await getPlansUseCase.execute();
      plans.value = result;
      if (plans.isNotEmpty) {
        selectedPlanId.value = plans.firstWhere((p) => p.isPopular, orElse: () => plans.first).id;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void selectPlan(String id) {
    selectedPlanId.value = id;
  }

  void startTrial() {
    Get.snackbar("Subscription", "Trial started successfully!", snackPosition: SnackPosition.TOP);
  }
}
