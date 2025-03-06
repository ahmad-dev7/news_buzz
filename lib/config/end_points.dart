import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsFeedEndPoints {
  // Load API key from .env file, assign '' if not found
  static final String apiKey = dotenv.env['NEWS_API_KEY'] ?? '';

  // Construct the base URL dynamically
  static final String url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
}
