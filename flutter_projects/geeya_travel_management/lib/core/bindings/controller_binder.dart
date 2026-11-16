import 'package:geeya_travel_management/features/profile/profile_home/presentation/controllers/profile_home_controller.dart';
import 'package:get/get.dart';
import '../../features/authentication/splash/presentation/controllers/splash_controller.dart';
import '../../features/authentication/login/presentation/controllers/login_controller.dart';
import '../../features/authentication/signup/presentation/controllers/signup_controller.dart';
import '../../features/authentication/forgot_password/presentation/controllers/forgot_password_controller.dart';
import '../../features/authentication/verification/presentation/controllers/verification_controller.dart';
import '../../features/authentication/reset_password/presentation/controllers/reset_password_controller.dart';
import '../../features/authentication/password_updated/presentation/controllers/password_updated_controller.dart';

import '../../features/home/presentation/controllers/home_controller.dart';
import '../../features/nav_bar/presentation/controllers/nav_bar_controller.dart';
import '../../features/profile/edit_profile/presentation/controllers/edit_profile_controller.dart';
import '../../features/profile/language/presentation/controllers/language_controller.dart';
import '../../features/subscription/data/data_sources/subscription_mock_data_source.dart';
import '../../features/subscription/data/repositories/subscription_data_repository.dart';
import '../../features/subscription/domain/repositories/subscription_domain_repository.dart';
import '../../features/subscription/domain/use_cases/get_subscription_plans_use_case.dart';
import '../../features/subscription/presentation/controllers/paywall_controller.dart';
import '../../features/subscription/presentation/controllers/membership_controller.dart';

import '../../features/discover/data/data_sources/discover_mock_data_source.dart';
import '../../features/discover/data/repositories/discover_data_repository.dart';
import '../../features/discover/domain/repositories/discover_domain_repository.dart';
import '../../features/discover/domain/use_cases/get_destinations_use_case.dart';
import '../../features/discover/presentation/controllers/discover_controller.dart';
import '../../features/guide_details/presentation/controllers/guide_details_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // Auth
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(), fenix: true);
    Get.lazyPut<VerificationController>(() => VerificationController(), fenix: true);
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(), fenix: true);
    Get.lazyPut<PasswordUpdatedController>(() => PasswordUpdatedController(), fenix: true);

    // Subscription
    Get.lazyPut<SubscriptionDataSource>(() => SubscriptionMockDataSource(), fenix: true);
    Get.lazyPut<SubscriptionDomainRepository>(
      () => SubscriptionDataRepository(dataSource: Get.find()),
      fenix: true,
    );
    Get.lazyPut<GetSubscriptionPlansUseCase>(
      () => GetSubscriptionPlansUseCase(repository: Get.find()),
      fenix: true,
    );
    Get.lazyPut<PaywallController>(
      () => PaywallController(getPlansUseCase: Get.find()),
      fenix: true,
    );
    Get.lazyPut<MembershipController>(() => MembershipController(), fenix: true);

    // Discover
    Get.lazyPut<DiscoverDataSource>(() => DiscoverMockDataSource(), fenix: true);
    Get.lazyPut<DiscoverDomainRepository>(
      () => DiscoverDataRepository(dataSource: Get.find()),
      fenix: true,
    );
    Get.lazyPut<GetDestinationsUseCase>(
      () => GetDestinationsUseCase(repository: Get.find()),
      fenix: true,
    );
    Get.lazyPut<DiscoverController>(
      () => DiscoverController(getDestinationsUseCase: Get.find()),
      fenix: true,
    );
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
      fenix: true,
    );
    Get.lazyPut<ProfileHomeController>(
      () => ProfileHomeController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<GuideDetailsController>(
      () => GuideDetailsController(),
      fenix: true,
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
      fenix: true,
    );
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
      fenix: true,
    );
  }
}
