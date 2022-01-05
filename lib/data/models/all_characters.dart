import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:rick_morty_bloc/data/models/characterDTO.dart';
import 'package:rick_morty_bloc/data/models/info.dart';

class AllCharacters extends Equatable {
  final Info info;
  final List<CharacterDTO> characters;

  const AllCharacters({required this.info, required this.characters});

  AllCharacters copyWith({
    Info? info,
    List<CharacterDTO>? characters,
  }) {
    return AllCharacters(
      info: info ?? this.info,
      characters: characters ?? this.characters,
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
      info: Info.fromMap(map['info']),
      characters: List<CharacterDTO>.from(
          map['results']?.map((x) => CharacterDTO.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharacters.fromJson(String source) =>
      AllCharacters.fromMap(json.decode(source));

  @override
  List<Object?> get props => [info, characters];
}
