import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';

class CharacterRepository {
  CharacterRepository({required this.remoteDS});

  final ApiProvider remoteDS;

  Future fetchAllCharacters({required int page}) async {
    var data = await remoteDS.fetchPageCharacters(page: page);

    print('Got in fetchAllCharacters');
    return AllCharacters.fromJson(data);
  }

  Future fetchEpisodes(String episodes) async {
    print("Got in fetchEpisodes");
    var formattedEpisodes =
        await remoteDS.fetchSelectedEpisodes(page: episodes);

    return episodesFromJson(formattedEpisodes);
  }
}
