import 'featured_destination.dart';

class HomeContent {
  final List<FeaturedDestination> featured;
  final WorthKnowing worthKnowing;

  HomeContent({required this.featured, required this.worthKnowing});
}

class WorthKnowing {
  final String title;
  final String description;
  final String quote;
  final String author;

  WorthKnowing({
    required this.title,
    required this.description,
    required this.quote,
    required this.author,
  });
}
