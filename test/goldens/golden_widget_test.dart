import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:rick_morty_bloc/character_list_view/views/character_details_screen.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_card.dart';

import '../utils/wrap_with_scaffold.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  // MockCharacterRepository characterRepository = MockCharacterRepository();

  group('CharacterCard', () {
    testGoldens('CharacterCard golden', (tester) async {
      await mockNetworkImagesFor(
        () async {
          final character = Character(
              name: "name",
              status: "status",
              species: "species",
              type: "type",
              gender: "gender",
              location: "location",
              image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              firstEpisode: "firstEpisode");

          final widget =
              wrapWithScaffoldApp(CharacterCard(character: character));
          await tester.pumpWidgetBuilder(widget);
        },
      );

      await screenMatchesGolden(
        tester,
        'CharacterCard',
      );
    });
  });

  group('ListView', () {
    testGoldens('ListView golden', (tester) async {
      List<Character> characters = [
        Character(
            name: "name",
            status: "status",
            species: "species",
            type: "type",
            gender: "gender",
            location: "location",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            firstEpisode: "firstEpisode"),
        Character(
            name: "name",
            status: "status",
            species: "species",
            type: "type",
            gender: "gender",
            location: "location",
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            firstEpisode: "firstEpisode"),
        Character(
            name: "name",
            status: "status",
            species: "species",
            type: "type",
            gender: "gender",
            location: "location",
            image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
            firstEpisode: "firstEpisode"),
      ];

      await mockNetworkImagesFor(
        () async {
          final widget = ListView.builder(
            itemCount: characters.length,
            itemBuilder: (ctx, index) =>
                CharacterCard(character: characters[index]),
          );

          // final widget = CharacterCard(character: character);
          await tester.pumpWidgetBuilder(widget);
        },
      );

      await screenMatchesGolden(
        tester,
        'ListView',
      );
    });
  });

  group('CharacterDetails', () {
    testGoldens('CharacterDetails golden', (tester) async {
      await mockNetworkImagesFor(
        () async {
          final character = Character(
              name: "name",
              status: "status",
              species: "species",
              type: "type",
              gender: "gender",
              location: "location",
              image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              firstEpisode: "firstEpisode");

          final widget = wrapWithMaterialApp(
              CharacterDetailsScreen(character: character), null);
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
