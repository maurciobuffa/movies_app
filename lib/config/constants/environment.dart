import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDBKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No key found!';
  static String movieDBBaseUrl =
      dotenv.env['THE_MOVIEDB_BASE_URL'] ?? 'No base url found!';
  static String movieDBLanguage =
      dotenv.env['THE_MOVIEDB_LANGUAGE'] ?? 'No language found!';
}
