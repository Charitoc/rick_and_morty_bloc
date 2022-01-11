part of 'character_bloc.dart';

class CharactersState extends Equatable {
  final List<Character> characters;
  final List<Episode> episodes;
  final bool isLoading;
  final int page;

  const CharactersState({
    required this.characters,
    required this.episodes,
    required this.isLoading,
    required this.page,
  });

  @override
  List<Object?> get props => [characters, isLoading, page];

  factory CharactersState.initial({
    required List<Character> characters,
    required List<Episode> episodes,
    required bool isLoading,
    required int page,
  }) {
    return const CharactersState(
        characters: [], episodes: [], isLoading: true, page: 1);
  }

  CharactersState success({
    required List<Character> characters,
    required List<Episode> episodes,
    required bool isLoading,
    required int page,
  }) =>
      copyWith(
        characters: characters,
        episodes: episodes,
        isLoading: isLoading,
        page: page,
      );

  CharactersState copyWith({
    List<Character>? characters,
    List<Episode>? episodes,
    bool? isLoading,
    int? page,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      episodes: episodes ?? this.episodes,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
