import 'package:dio/dio.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

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

  static Future<AllCharacters> getPageCharacters() async {
    var options = BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/character',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain,
      method: "GET",
    );
    late Dio dio = Dio(options);

    final response = await dio.request('');
    print(response.data);
    return AllCharacters.fromJson(response.data);
  }
}
