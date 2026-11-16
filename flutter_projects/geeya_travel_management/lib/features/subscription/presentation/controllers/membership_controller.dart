import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MembershipController extends GetxController {
  final currentPlan = "Monthly Plan".obs;
  final nextBillingDate = "Oct 24, 2024".obs;
  final price = "\$9.99/mo".obs;

  void cancelSubscription() {
    Get.defaultDialog(
      title: "Cancel Subscription",
      middleText: "Are you sure you want to cancel your subscription? You will lose access to premium features at the end of your billing cycle.",
      textConfirm: "Yes, Cancel",
      textCancel: "No, Keep",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        Get.back();
        Get.snackbar("Subscription", "Subscription cancelled", snackPosition: SnackPosition.TOP);
      },
    );
  }

  void changePlan() {
    Get.toNamed('/paywall');
  }
}
