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

void main() {
  late CharacterRepository characterRepository;
  late CharacterBloc characterBloc;

  final Location loc = Location("name", "sd");
  List<String> charlist = ['url1', 'url2'];
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
      url: 'url',
    ),
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
      id: 4,
      origin: loc,
      url: 'url',
    ),
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
      id: 3,
      origin: loc,
      url: 'url',
    ),
  ];

  List<Episode> episodes = [
    Episode(1, 'name', 'airDate', 'episode', [], 'url', DateTime(2021)),
    Episode(2, 'name', 'airDate', 'episode', [], 'url', DateTime(2021)),
    Episode(3, 'name', 'airDate', 'episode', [], 'url', DateTime(2021)),
    Episode(4, 'name', 'airDate', 'episode', [], 'url', DateTime(2021)),
  ];

  final allCharacters = AllCharacters(info: info, characters: characterList);

  setUp(() async {
    characterRepository = MockCharacterRepository();
    characterBloc = CharacterBloc(characterRepository);
  });
  group("CharacterBloc", () {
    tearDown(() {
      characterBloc.close();
    });

    test("The initial state of the Bloc is []", () {
      expect(characterBloc.state.characters, []);
    });

    // blocTest<CharacterBloc, CharactersState>(
    //   "Fetching internet data is",
    //   build: () => characterBloc,
    //   act: (bloc) => bloc.add(CharactersFetchingEvent()),
    //   expect: () => CharactersState(characters: [], episodes: [], isLoading: ),
    // );

    blocTest<CharacterBloc, CharactersState>(
      "Fetching internet data is",
      build: () {
        when(() => characterRepository.fetchAllCharacters(page: 1))
            .thenAnswer((_) async => allCharacters);

        when(() => characterRepository.fetchEpisodes(any()))
            .thenAnswer((_) async => episodes);
        return characterBloc;
      },
      seed: () => const CharactersState(
          characters: [], episodes: [], isLoading: true, page: 1),
      act: (bloc) => bloc.add(CharactersFetchingEvent()),
      expect: () => [],
    );
  });
}
