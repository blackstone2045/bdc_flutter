class ApiConstants {
  static const String baseUrl = 'https://crud.devjahidhasan.com/api/v1';

  static const String imageBaseUrl = 'https://crud.devjahidhasan.com';

  static const String products = '/products';
  static const String tasks = '/tasks';
  static const int imageMaxSize = 2 * 1024 * 1024;
  static String getProductImageUrl(String imagePath) {
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }

    return Uri.parse(ApiConstants.imageBaseUrl).resolve(imagePath).toString();
  }
}
