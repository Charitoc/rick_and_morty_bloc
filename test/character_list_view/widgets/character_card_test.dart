import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/character_list_view/views/character_details_screen.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_card.dart';

import '../../utils/wrap_with_scaffold.dart';

class MockRepository extends Mock implements CharacterRepository {}

void main() {
  group("CharacterCard", () {
    const character = Character(
        name: "name",
        status: "status",
        species: "species",
        type: "type",
        gender: "gender",
        location: "location",
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
        firstEpisode: "firstEpisode");

    testWidgets("gets tapped", (tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(wrapWithScaffoldApp(const CharacterCard(
            character: character,
          )));
        },
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      expect(find.byType(CharacterDetailsScreen), findsOneWidget);
    });

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

          // final BuildContext context = tester.element(find.byType(MaterialApp));
          // print(context);
          final widget =
              wrapWithScaffoldApp(const CharacterCard(character: character));
          await tester.pumpWidgetBuilder(widget);
        },
      );

      await screenMatchesGolden(
        tester,
        'CharacterCard',
      );
    });
  });
}
