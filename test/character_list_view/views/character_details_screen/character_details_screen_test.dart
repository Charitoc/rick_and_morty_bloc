import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_morty_bloc/character_list_view/views/character_details_screen.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

import '../../../utils/wrap_with_scaffold.dart';

void main() {
  group('CharacterDetails', () {
    testGoldens('passes golden test', (tester) async {
      await mockNetworkImagesFor(
        () async {
          const character = Character(
              name: "name",
              status: "status",
              species: "species",
              type: "type",
              gender: "gender",
              location: "location",
              image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              firstEpisode: "firstEpisode");

          final widget = wrapWithMaterialApp(
              const CharacterDetailsScreen(character: character), null);
          await tester.pumpWidgetBuilder(widget);
        },
      );
      await screenMatchesGolden(
        tester,
        'CharacterDetails',
      );
    });
  });
}
