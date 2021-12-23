part of 'character_bloc.dart';

@immutable
abstract class CharactersEvent {}

class CharactersFetchingEvent extends CharactersEvent {
  // int page = 1;
  CharactersFetchingEvent();
}

class CharactersFetchedEvent extends CharactersEvent {
  late final List<Character> allCharacters;
  CharactersFetchedEvent({required this.allCharacters});
}
