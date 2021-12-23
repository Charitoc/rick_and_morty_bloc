part of 'character_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {
  final List<Character> characters = [];
  // final Info.
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CharacterInitialState extends CharactersState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

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

  CharacterFetchedState copyWith({
    List<Character>? characters,
  }) {
    return CharacterFetchedState(
      characters: characters ?? this.characters,
    );
  }
}
