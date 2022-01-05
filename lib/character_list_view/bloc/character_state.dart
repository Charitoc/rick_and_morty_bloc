part of 'character_bloc.dart';

class CharactersState extends Equatable {
  final List<Character> characters;
  final List<Episode> episodes;
  // final Map<int, String> map;
  final bool isLoading;
  final int page;

  const CharactersState({
    required this.characters,
    required this.episodes,
    // required this.map,
    required this.isLoading,
    required this.page,
  });

  @override
  List<Object?> get props => [characters, isLoading, page];

  CharactersState loading() => copyWith(isLoading: true);

  CharactersState copyWith({
    List<Character>? characters,
    List<Episode>? episodes,
    Map<int, String>? map,
    bool? isLoading,
    int? page,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      episodes: episodes ?? this.episodes,
      // map: map ?? this.map,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
