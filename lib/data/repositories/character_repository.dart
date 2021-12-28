import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';
import 'package:rick_morty_bloc/data/models/info.dart';

class CharacterRepository {
  Future fetchAllCharacters({required int page}) async {
    var data = await DataProvider.fetchPageCharacters(page: page);

    print('Got in fetchAllCharacters');
    return AllCharacters.fromJson(data);
  }

  // Future<List<Episode>> getEpisodes() async {
  //   List<String> episodes = characterList.map((e) {
  //     return e.episode.isNotEmpty ? e.episode[0] : '';
  //   }).toList();

  //   List<String> episodeIds = episodes
  //       .map((e) {
  //         List<String> splits = e.split('/');
  //         return splits[splits.length - 1];
  //       })
  //       .toSet()
  //       .toList();

  //   AllEpisodes formattedEpisodes =
  //       await DataProvider.getSelectedEpisodes(page: episodeIds.join(','));
  //   episodesList.addAll(formattedEpisodes.episodes);
  //   return episodesList;
  // }

  Future fetchEpisodes(String episodes) async {
    print("Got in fetchEpisodes");
    var formattedEpisodes =
        await DataProvider.fetchSelectedEpisodes(page: episodes);

    return episodesFromJson(formattedEpisodes);
  }
}
