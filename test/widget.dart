// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_bloc/data/models/characterDTO.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

import 'package:rick_morty_bloc/main.dart';
import 'package:rick_morty_bloc/presentation/character_list/bloc/character_bloc.dart';

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
