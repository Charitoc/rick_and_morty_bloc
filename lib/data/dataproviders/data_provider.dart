import 'package:dio/dio.dart';

class ApiProvider {
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
    return response.data;
  }

  static Future fetchSelectedEpisodes({required String page}) async {
    var options = BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/episode/' + page,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain,
      method: "GET",
    );
    late Dio dio = Dio(options);

    final response = await dio.request('');
    return response.data;
  }
}
