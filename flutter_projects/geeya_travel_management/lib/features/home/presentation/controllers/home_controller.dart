import 'package:get/get.dart';

class HomeController extends GetxController {
  final featuredDestinations = [
    {
      'city': 'Rome',
      'country': 'ITALY',
      'tag': 'CITY GUIDE',
      'description': 'A practical way into a city that has never cared about being practical.',
      'image': 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800&q=80',
    },
    {
      'city': 'Lisbon',
      'country': 'PORTUGAL',
      'tag': 'CITY GUIDE',
      'description': 'Tiled streets and sun-drenched squares in one of Europe\'s most charming places.',
      'image': 'https://images.unsplash.com/photo-1548126032-079a0fb0099d?w=800&q=80',
    },
  ].obs;

  final worthKnowing = {
    'title': 'Lisbon rewards the early table.',
    'description': 'The city eats later than you think, but its best bakeries belong to the morning.',
    'quote': 'Go before nine. Order at the counter, take the seat by the window, and leave the afternoon for somewhere else.',
    'author': 'g.'
  }.obs;
}
