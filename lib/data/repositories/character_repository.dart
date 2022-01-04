import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/characterDTO.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';
import 'package:rick_morty_bloc/data/models/info.dart';

class CharacterRepository {
  Future fetchAllCharacters({required int page}) async {
    var data = await ApiProvider.fetchPageCharacters(page: page);

    print('Got in fetchAllCharacters');
    return AllCharacters.fromJson(data);
  }

  Future fetchEpisodes(String episodes) async {
    print("Got in fetchEpisodes");
    var formattedEpisodes =
        await ApiProvider.fetchSelectedEpisodes(page: episodes);

    return episodesFromJson(formattedEpisodes);
  }
}
