import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/destination.dart';
import '../../domain/use_cases/get_destinations_use_case.dart';

class DiscoverController extends GetxController {
  final GetDestinationsUseCase getDestinationsUseCase;

  DiscoverController({required this.getDestinationsUseCase});

  final destinations = <Destination>[].obs;
  final isLoading = true.obs;
  final isGridView = true.obs;
  final searchController = TextEditingController();

  final categories = ["City Guides", "Road Trips", "National Parks", "Hidden Gems", "Travel Tips", "Local Attractions", "Weekend Getaways", "Camping Spots", "Scenic Routes", "Beaches", "Mountain Escapes", "Historic Sites", "Wildlife & Nature"].obs;
  final selectedCategory = "".obs;
  final filters = ["All", "Move", "Eat", "Stay", "Explore", "Discover", "Shop", "Relax", "Adventure", "Nature", "Culture", "Events", "Activities", "Attractions", "Wellness", "Nightlife", "Family", "Outdoor"].obs;
  final selectedFilter = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    isLoading.value = true;
    try {
      final result = await getDestinationsUseCase.execute();
      destinations.value = result;
    } finally {
      isLoading.value = false;
    }
  }

  void toggleView() {
    isGridView.value = !isGridView.value;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
