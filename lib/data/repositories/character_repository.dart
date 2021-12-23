import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/all_episodes.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';
import 'package:rick_morty_bloc/data/models/info.dart';

class CharacterRepository {
  List<Character> characterList = [];
  List<Episode> episodesList = [];
  Info characterInfo =
      Info(826, 42, "https://rickandmortyapi.com/api/character/?page=1", null);
  Info episodeInfo =
      Info(51, 3, "https://rickandmortyapi.com/api/episode?page=1", null);

  Future<void> getCharacter() async {
    Character singleCharacter = await DataProvider.getSingleCharacter();
    print(singleCharacter.name);
    characterList.add(singleCharacter);
  }

  Future<List<Character>> getAllCharacters({required String page}) async {
    AllCharacters pageCharacters =
        await DataProvider.getPageCharacters(page: page);
    print('Got in getAllCharacters');
    characterList.addAll(pageCharacters.characters);
    characterInfo = pageCharacters.info;
    // print(episodeIds.join(','));
    // AllEpisodes formattedEpisodes =
    //     await DataProvider.getSelectedEpisodes(page: episodeIds.join(','));
    // episodesList.addAll(formattedEpisodes.episodes);
    // print(formattedEpisodes);
    return characterList;
  }

  // Future<List<Episode>> getAllEpisodes({required String page}) async {
  //   AllEpisodes episodes = await DataProvider.getAllEpisodes(page: page);
  //   print('Got in getAllEpisodes');
  //   episodesList.addAll(episodes.episodes);
  //   characterInfo = episodes.info;
  //   return episodesList;
  // }

  Future<List<Episode>> getEpisodes() async {
    List<String> episodes = characterList.map((e) {
      return e.episode.isNotEmpty ? e.episode[0] : '';
    }).toList();

    List<String> episodeIds = episodes
        .map((e) {
          List<String> splits = e.split('/');
          return splits[splits.length - 1];
        })
        .toSet()
        .toList();

    List<Episode> formattedEpisodes =
        await DataProvider.getSelectedEpisodes(page: episodeIds.join(','));
    return formattedEpisodes;
  }

  // Future<List<Episode>> getIndex(String index){

  // }
}
