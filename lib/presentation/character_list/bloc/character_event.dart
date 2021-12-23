part of 'character_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {}

class CharactersFetchingEvent extends CharactersEvent {
  CharactersFetchingEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// class CharactersFetchedEvent extends CharactersEvent {
//   late final List<Character> allCharacters;
//   CharactersFetchedEvent({required this.allCharacters});

//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
