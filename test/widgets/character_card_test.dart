import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/character_list_view/views/character_details_screen.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_card.dart';

import '../utils/wrap_with_scaffold.dart';

// class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRepository extends Mock implements CharacterRepository {}

void main() {
  group("CharacterCard", () {
    final character = Character(
        name: "name",
        status: "status",
        species: "species",
        type: "type",
        gender: "gender",
        location: "location",
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
        firstEpisode: "firstEpisode");

    // testWidgets("gets tapped", (tester) async {
    //   await tester.pumpWidget(MaterialApp(
    //       navigatorObservers: [mockObserver], home: CharacterListPage()));

    //   await tester.tap(find.byType(GestureDetector));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(CharacterDetailsScreen), findsOneWidget);
    // });

    // final mockObserver = MockNavigatorObserver();
    // final mockRepository = MockRepository();

    testWidgets("gets tapped", (tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(wrapWithScaffoldApp(CharacterCard(
            character: character,
          )));
        },
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      expect(find.byType(CharacterDetailsScreen), findsOneWidget);
    });
  });
}
