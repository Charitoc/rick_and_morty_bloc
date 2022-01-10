import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_card.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

import '../../../utils/wrap_with_scaffold.dart';

void main() {
  group('ListView', () {
    testGoldens('passes golden test', (tester) async {
      const List<Character> characters = [
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
          final widget = wrapWithScaffoldApp(ListView.builder(
            itemCount: characters.length,
            itemBuilder: (ctx, index) =>
                CharacterCard(character: characters[index]),
          ));
          await tester.pumpWidgetBuilder(widget);
        },
      );

      await screenMatchesGolden(
        tester,
        'ListView',
      );
    });
  });
}
