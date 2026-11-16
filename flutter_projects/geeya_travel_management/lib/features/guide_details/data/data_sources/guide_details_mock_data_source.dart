import '../../domain/entities/guide_details.dart';
import '../models/guide_details_model.dart';

abstract class GuideDetailsDataSource {
  Future<GuideDetailsModel> getGuideDetails(String cityId);
}

class GuideDetailsMockDataSource implements GuideDetailsDataSource {
  @override
  Future<GuideDetailsModel> getGuideDetails(String cityId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return GuideDetailsModel(
      city: 'Lisbon',
      country: 'PORTUGAL',
      tag: 'CITY GUIDE',
      heroImage: 'https://images.unsplash.com/photo-1548126032-079a0fb0099d?w=1000&q=80',
      description: 'A practical way into a city that has never cared about being practical.',
      overviewTitle: 'A city that gives more when you leave space for it.',
      overviewBody: 'Lisbon is best understood slowly. It’s the blue-tiled facades, the sound of the fado from an open window, and the steep climb up to the Miradouros that really let you feel its rhythm.\n\nBegin with one neighborhood and stay there longer than you think. Walk before the streets warm up, stop when a scent leads you, and keep the evening loose.',
      geeyaSays: 'Take the tram early, standing in the back so you can see the tracks winding behind you. Don’t worry about making plans—leave space for spontaneous breakfast reservations.',
      secondImage: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=1000&q=80',
      sections: [
        PlanSection(
          title: 'BREAKFAST',
          icon: 'cafe',
          time: '9:00am',
          suggestionCount: 3,
          isExpanded: false,
          places: [
            PlaceSuggestion(
              name: 'Du Pain et des Idées',
              subtitle: 'for local food',
              since: 'since 1889',
              description: 'Try the escargot chocola-pistache. It’s the soul of Canal Saint-Martin in a pastry.',
              category: 'CAFE',
              location: 'Canal Saint-Martin',
            ),
            PlaceSuggestion(
              name: 'Café de Flore',
              subtitle: 'the best bakaries',
              description: 'Neither art nor literature would have been quite the same without the place you should take your morning cafe au lait.',
              category: 'CAFE',
              location: 'St. Germain-des-Prés',
            ),
            PlaceSuggestion(
              name: 'Ten Belles',
              subtitle: 'coffee',
              description: 'The cafe for the really good stuff. Nobody comes for the view, but everyone stays for the beans.',
              category: 'CAFE',
              location: 'Canal Saint-Martin',
            ),
          ],
        ),
        PlanSection(
          title: 'MORNING ACTIVITY',
          icon: 'museum',
          time: '11:00am',
          suggestionCount: 2,
          places: [],
        ),
        PlanSection(
          title: 'LUNCH',
          icon: 'restaurant',
          time: '1:30pm',
          suggestionCount: 3,
          places: [],
        ),
        PlanSection(
          title: 'AFTERNOON ACTIVITY',
          icon: 'explore',
          time: '3:30pm',
          suggestionCount: 4,
          places: [],
        ),
        PlanSection(
          title: 'DINNER',
          icon: 'wine_bar',
          time: '7:30pm',
          suggestionCount: 3,
          places: [],
        ),
        PlanSection(
          title: 'STAY NEAR THE RIGHT STREET',
          icon: 'hotel',
          time: '9:30pm',
          suggestionCount: 2,
          places: [],
        ),
        PlanSection(
          title: 'EVENING',
          icon: 'nightlife',
          time: '11:00pm',
          suggestionCount: 1,
          places: [],
        ),
      ],
    );
  }
}
