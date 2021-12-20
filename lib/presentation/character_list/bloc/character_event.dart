part of 'character_bloc.dart';

@immutable
abstract class CharactersEvent {}

class CharactersLoadingEvent extends CharactersEvent {
  CharactersLoadingEvent();
}

class CharactersLoadedEvent extends CharactersEvent {
  late final List<Character> allCharacters;
  CharactersLoadedEvent({required this.allCharacters});
}

class DummyEvent extends CharactersEvent {
  DummyEvent();
}
