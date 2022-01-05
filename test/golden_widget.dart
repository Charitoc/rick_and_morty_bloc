import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_card.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  MockCharacterRepository characterRepository = MockCharacterRepository();

  // testGoldens('Golden test', (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp(
  //     repository: characterRepository,
  //   ));
  //   await expectLater(find.byType(MyApp), matchesGoldenFile('main.png'));
  // });

  group('AppbarBackground', () {
    testGoldens('AppbarBackground golden', (tester) async {
      await mockNetworkImagesFor(
        () async {
          // to test sou

          final character = Character(
              name: "name",
              status: "status",
              species: "species",
              type: "type",
              gender: "gender",
              location: "location",
              image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              firstEpisode: "firstEpisode");

          final widget = CharacterCard(character: character);
          await tester.pumpWidgetBuilder(widget);
          // widget = Scaffold(
          //   body: BlocProvider(
          //       create: (context) => CharacterBloc(characterRepository),
          //       child: CharacterCard(character: character)),
          // );
        },
      );

      await screenMatchesGolden(
        tester,
        'main',
      );
    });
  });
}
