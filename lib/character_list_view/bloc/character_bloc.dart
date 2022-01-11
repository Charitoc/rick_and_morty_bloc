import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/character_dto.dart';
import 'package:rick_morty_bloc/data/models/character_dto_to_character_mapper.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharacterBloc(this.characterRepository)
      : super(CharactersState.initial(
            characters: const [],
            episodes: const [],
            isLoading: true,
            page: 1)) {
    on<CharactersFetchingEvent>((event, emit) async {
      print('before fetch');
      AllCharacters allchars =
          await characterRepository.fetchAllCharacters(page: state.page);
      final charactersNextPageDTO = allchars.characters;
      final episodes = await fetchEps(charactersNextPageDTO);

      List<Character> charactersNextPage =
          CharacterDTOtoCharacter.mapper(charactersNextPageDTO, episodes);

      emit(state.success(
          characters: List.from(state.characters + charactersNextPage),
          episodes: state.episodes + episodes,
          isLoading: false,
          page: state.page + 1));
    });
  }

  Future<List<Episode>> fetchEps(List<CharacterDTO> charactersnextpage) async {
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
    return episodeList;
  }

  Future<Map<int, String>> toMap(
      List<CharacterDTO> characters, List<Episode> episodes) async {
    final Map<int, String> map = {};

    for (CharacterDTO character in characters) {
      for (Episode episode in episodes) {
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
