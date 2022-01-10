import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty_bloc/character_list_view/bloc/character_bloc.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/character_dto.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';
import 'package:rick_morty_bloc/data/models/info.dart';
import 'package:rick_morty_bloc/data/models/location.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

class MockAllchars extends Mock implements AllCharacters {}

class MockEpisodes extends Mock implements Episode {}

void main() {
  final Location loc = Location("location", "location");
  List<String> charlist = ["url", 'sdfsdf'];
  List<Episode> episodes = [
    Episode(2, "firstEpisode", "airDate", "episode", charlist, "url",
        DateTime.now()),
  ];
  final Info info =
      Info(826, 42, "https://rickandmortyapi.com/api/character/?page=1", null);
  List<CharacterDTO> characterList = [
    CharacterDTO(
      name: "name",
      status: "status",
      species: "species",
      type: "type",
      gender: "gender",
      location: loc,
      image: "image",
      created: DateTime.now(),
      episode: charlist,
      id: 2,
      origin: loc,
      url: "url",
    ),
  ];

  List<Character> characters = [
    const Character(
        name: "name",
        status: "status",
        species: "species",
        type: "type",
        gender: "gender",
        location: "location",
        image: "image",
        firstEpisode: "firstEpisode"),
  ];

  final allCharacters = AllCharacters(info: info, characters: characterList);

  group("CharacterBloc", () {
    late MockCharacterRepository characterRepository;
    late CharacterBloc characterBloc;

    setUp(() {
      characterRepository = MockCharacterRepository();
      characterBloc = CharacterBloc(characterRepository);
    });

    test("The initial state of the Bloc is []", () {
      expect(characterBloc.state.characters, []);
    });

    blocTest<CharacterBloc, CharactersState>(
      "Fetching internet data is",
      build: () {
        when(() => characterRepository.fetchAllCharacters(page: 1))
            .thenAnswer((realInvocation) async => allCharacters);
        when(() => characterRepository.fetchEpisodes(any()))
            .thenAnswer((realInvocation) async => episodes);
        return characterBloc;
      },
      seed: () => const CharactersState(
          characters: [], episodes: [], isLoading: true, page: 1),
      act: (bloc) => bloc.add(CharactersFetchingEvent()),
      expect: () => [
        CharactersState(
            characters: characters,
            episodes: episodes,
            isLoading: false,
            page: 2)
      ],
    );
  });
}
