part of 'character_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {}

class CharacterFetchingState extends CharactersState {
  CharacterFetchingState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CharacterFetchedState extends CharactersState {
  late final List<Character> characters;
  //late final Repository repository;
  CharacterFetchedState({required this.characters});

  @override
  // TODO: implement props
  List<Object?> get props => [characters];
}

class CharacterErrorState extends CharactersState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DummyState extends CharactersState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
