import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
// import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharacterBloc(this.characterRepository) : super(CharacterFetchingState()) {
    void changeevent() {
      print("hello world");
      emit(DummyState());
    }

    on<CharactersLoadingEvent>((event, emit) async {
      characterRepository.printHello();
      await characterRepository.getAllCharacters();
      //print(characterRepository.characterList.length);
      emit(
          CharacterFetchedState(characters: characterRepository.characterList));
    });

    on<DummyEvent>((event, emit) {
      changeevent();
    });
  }
}
