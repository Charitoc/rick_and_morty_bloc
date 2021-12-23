import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharacterBloc(this.characterRepository)
      : super(CharactersState(characters: [], isLoading: true, page: 1)) {
    on<CharactersFetchingEvent>((event, emit) async {
      // emit(state.copyWith(
      //     characters: state.characters,
      //     isLoading: state.isLoading,
      //     page: state.page));
      List<Character> charactersnextpage =
          await characterRepository.fetchAllCharacters(page: state.page);

      print(state.characters.length);
      print("state.page : ${state.isLoading}");
      print(charactersnextpage.length);
      emit(state.copyWith(
          characters: List.from(state.characters + charactersnextpage),
          isLoading: false,
          page: state.page + 1));
    });
  }
}
