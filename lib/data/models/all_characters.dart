import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/info.dart';

class AllCharacters {
  final Info info;
  final List<Character> characters;

  AllCharacters(
    this.info,
    this.characters,
  );

  AllCharacters copyWith({
    Info? info,
    List<Character>? characters,
  }) {
    return AllCharacters(
      info ?? this.info,
      characters ?? this.characters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'results': characters.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCharacters.fromMap(Map<String, dynamic> map) {
    return AllCharacters(
      Info.fromMap(map['info']),
      List<Character>.from(map['results']?.map((x) => Character.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharacters.fromJson(String source) =>
      AllCharacters.fromMap(json.decode(source));

  @override
  String toString() => 'AllCharacters(info: $info, characters: $characters)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharacters &&
        other.info == info &&
        listEquals(other.characters, characters);
  }

  @override
  int get hashCode => info.hashCode ^ characters.hashCode;
}
