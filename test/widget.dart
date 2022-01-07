// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:mockito/mockito.dart';
import 'package:rick_morty_bloc/data/models/character_dto.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

class MockCharacter extends Mock implements CharacterDTO {}

void main() {
  // MockCharacterRepository characterRepository;

  // test("Get character name", () async {
  //   MockCharacter char;

  //   char = characterRepository.fetchAllCharacters(page: 1);
  // });

  // group("CharacterBloc", () {
  //   late CharacterBloc characterBloc;

  //   setUp(
  //     () {
  //       characterRepository = MockCharacterRepository();
  //       characterBloc = CharacterBloc(characterRepository);
  //     },
  //   );

  //   blocTest<CharacterBloc, int>(
  //     'emits [MyState] when MyEvent is added.',
  //     build: () => characterBloc,
  //     act: (bloc) => bloc.add(CharactersFetchingEvent()),
  //     expect: () => [],
  //   );
  // });
}
