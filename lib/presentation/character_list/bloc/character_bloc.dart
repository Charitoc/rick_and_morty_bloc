import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharacterBloc(this.characterRepository)
      : super(const CharactersState(
            characters: [], episodes: [], map: {}, isLoading: true, page: 1)) {
    on<CharactersFetchingEvent>((event, emit) async {
      AllCharacters allchars =
          await characterRepository.fetchAllCharacters(page: state.page);
      List<Character> charactersNextPage = allchars.characters;

      List<Episode> episodes = await fetchEps(charactersNextPage);

      print(
          'Episodes list length is: ${state.episodes.length} and last element is: ${episodes[episodes.length - 1].name}');

      print("page is: ${state.page}");

      Map<int, String> map = await toMap(charactersNextPage, episodes);
      map.addAll(state.map);
      emit(state.copyWith(
          characters: List.from(state.characters + charactersNextPage),
          episodes: state.episodes + episodes,
          map: map,
          isLoading: false,
          page: state.page + 1));
    });
  }

  Future<List<Episode>> fetchEps(List<Character> charactersnextpage) async {
    List<String> episodes = charactersnextpage.map((e) {
      return e.episode.isNotEmpty ? e.episode[0] : '';
    }).toList();

    List<String> episodeIds = episodes
        .map((e) {
          List<String> splits = e.split('/');
          return splits[splits.length - 1];
        })
        .toSet()
        .toList();

    List<Episode> episodeList =
        await characterRepository.fetchEpisodes(episodeIds.join(','));
    // print(episodeList);
    return episodeList;
  }

  Future<Map<int, String>> toMap(
      List<Character> characters, List<Episode> episodes) async {
    final Map<int, String> map = {};

    for (Character character in characters) {
      for (Episode episode in episodes) {
        // print(character.name);
        if (episode.url == character.episode[0]) {
          print(
              "Character's name is: ${character.name} and first episode name is: ${episode.name}");
          map[character.id] = episode.name;
        }
      }
    }
    return map;
  }
}
