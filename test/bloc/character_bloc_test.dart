import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_bloc/character_list_view/bloc/character_bloc.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  MockCharacterRepository characterRepository = MockCharacterRepository();
  late CharacterBloc characterBloc;

  setUp(() {
    characterBloc = CharacterBloc(characterRepository);
  });

  tearDown(() {
    characterBloc.close();
  });

  group("CharacterBloc", () {
    test("The initial state of the Bloc is []", () {
      expect(characterBloc.state.characters, []);
    });

    // blocTest<CharacterBloc, CharactersState>(
    //   "Fetching internet data is",
    //   build: () => characterBloc,
    //   act: (bloc) => bloc.add(CharactersFetchingEvent()),
    //   expect: () => CharactersState(characters: [], episodes: [], isLoading: ),
    // );
  });
}
