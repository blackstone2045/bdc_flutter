import '../models/destination_model.dart';

abstract class DiscoverDataSource {
  Future<List<DestinationModel>> getDestinations();
}

class DiscoverMockDataSource implements DiscoverDataSource {
  @override
  Future<List<DestinationModel>> getDestinations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      DestinationModel(
        id: '1',
        city: 'Rome',
        country: 'ITALY',
        imageUrl: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=500&q=80',
        category: 'Europe',
      ),
      DestinationModel(
        id: '2',
        city: 'Lisbon',
        country: 'PORTUGAL',
        imageUrl: 'https://images.unsplash.com/photo-1548126032-079a0fb0099d?w=500&q=80',
        category: 'Europe',
      ),
      DestinationModel(
        id: '3',
        city: 'Paris',
        country: 'FRANCE',
        imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=500&q=80',
        category: 'Europe',
      ),
      DestinationModel(
        id: '4',
        city: 'Kyoto',
        country: 'JAPAN',
        imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=500&q=80',
        category: 'Asia',
      ),
      DestinationModel(
        id: '5',
        city: 'Cairo',
        country: 'EGYPT',
        imageUrl: 'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=500&q=80',
        category: 'Africa',
      ),
    ];
  }
}
