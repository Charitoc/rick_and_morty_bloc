import 'package:dio/dio.dart';

class ApiProvider {
  ApiProvider._privateConstructor();

  static final ApiProvider instance = ApiProvider._privateConstructor();

  static final restClient = Dio(BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    responseType: ResponseType.plain,
  ));

  Future fetchPageCharacters({required int page}) async {
    return restClient
        .get('api/character/?page=' + page.toString())
        .then((response) => response.data);
  }

  Future fetchSelectedEpisodes({required String page}) async {
    return restClient
        .get('api/episode/' + page)
        .then((response) => response.data);
  }
}
