part of 'character_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {}

class CharactersFetchingEvent extends CharactersEvent {
  CharactersFetchingEvent();

  @override
  List<Object?> get props => [];
}
