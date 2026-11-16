class GuideDetails {
  final String city;
  final String country;
  final String tag;
  final String heroImage;
  final String description;
  final String overviewTitle;
  final String overviewBody;
  final String geeyaSays;
  final String secondImage;
  final List<PlanSection> sections;

  GuideDetails({
    required this.city,
    required this.country,
    required this.tag,
    required this.heroImage,
    required this.description,
    required this.overviewTitle,
    required this.overviewBody,
    required this.geeyaSays,
    required this.secondImage,
    required this.sections,
  });
}

class PlanSection {
  final String title;
  final String icon;
  final String time;
  final int suggestionCount;
  final List<PlaceSuggestion> places;
  bool isExpanded;

  PlanSection({
    required this.title,
    required this.icon,
    required this.time,
    required this.suggestionCount,
    required this.places,
    this.isExpanded = false,
  });
}

class PlaceSuggestion {
  final String name;
  final String subtitle;
  final String description;
  final String category;
  final String location;
  final String? since;

  PlaceSuggestion({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.location,
    this.since,
  });
}
