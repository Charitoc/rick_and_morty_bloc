import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharacterBloc(this.characterRepository) : super(CharacterInitialState()) {
    on<CharactersFetchingEvent>((event, emit) async {
      await characterRepository.getAllCharacters(
          page: characterRepository.characterInfo.next);
      characterRepository.getEpisodes();
      emit(CharacterFetchingState());
      emit(
          CharacterFetchedState(characters: characterRepository.characterList));
    });
  }
}
