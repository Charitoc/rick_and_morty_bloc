part of 'character_bloc.dart';

class CharactersState extends Equatable {
  final List<Character> characters;
  final List<Episode> episodes;
  final Map<int, String> map;
  final bool isLoading;
  final int page;

  const CharactersState({
    required this.characters,
    required this.episodes,
    required this.map,
    required this.isLoading,
    required this.page,
  });

  @override
  List<Object?> get props => [characters, isLoading, page];

  CharactersState loading() => copyWith(isLoading: true);

  // CharactersState success() => null;

  // String get
  Map<int, String> mapper(List<Character> chars, List<Episode> episodes) {
    final Map<int, String> map = {};

    for (Character character in characters) {
      for (Episode episode in episodes) {
        // print(character.name);
        if (episode.url == character.episode[0]) {
          print(
              "Character's name is: ${character.name} and first episode name is: ${episode.name}");
          map[character.id] = episode.name;
        }
      }

      // }

      // List.from(characters.map((e) => e.episode[0]));
    }
    // print(map);
    return map;
  }

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
      map: map ?? this.map,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
