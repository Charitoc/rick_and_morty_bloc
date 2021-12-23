part of 'character_bloc.dart';

class CharactersState extends Equatable {
  final List<Character> characters;
  final bool isLoading;
  final int page;
  const CharactersState({
    required this.characters,
    required this.isLoading,
    required this.page,
  });

  @override
  List<Object?> get props => [characters, isLoading, page];

  CharactersState loading() => copyWith(isLoading: true);

  // CharactersState success() => null;

  CharactersState copyWith({
    List<Character>? characters,
    bool? isLoading,
    int? page,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
