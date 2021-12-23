import 'package:dio/dio.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/all_episodes.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';

class DataProvider {
  //late Dio dio;

  static Future<Character> getSingleCharacter() async {
    var options = BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/character/2',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain,
      method: "GET",
    );
    late Dio dio = Dio(options);

    final response = await dio.request('');
    return Character.fromJson(response.data);

    //return response.data;
  }

  static Future<AllCharacters> getPageCharacters({required String page}) async {
    var options = BaseOptions(
      baseUrl: page,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain,
      method: "GET",
    );
    late Dio dio = Dio(options);

    final response = await dio.request('');
    // print(response.data);
    return AllCharacters.fromJson(response.data);
  }

  static Future fetchPageCharacters({required int page}) async {
    var options = BaseOptions(
      baseUrl:
          'https://rickandmortyapi.com/api/character/?page=' + page.toString(),
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain,
      method: "GET",
    );
    late Dio dio = Dio(options);

    final response = await dio.request('');
    // print(response.data);
    return AllCharacters.fromJson(response.data);
  }

  static Future<AllEpisodes> getSelectedEpisodes({required String page}) async {
    var options = BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/episode/' + page,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain,
      method: "GET",
    );
    late Dio dio = Dio(options);
    print(options.baseUrl);
    final response = await dio.request('');
    print(response.data);
    AllEpisodes episodelist = AllEpisodes.fromJson(response.data);
    //response.data;

    // return List<Episode.fromJson(response.data)>;
    // return [];
    return episodelist;
  }
}
