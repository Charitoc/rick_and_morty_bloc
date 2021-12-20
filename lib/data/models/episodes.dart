import 'dart:convert';

import 'package:flutter/foundation.dart';

class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  Episode(
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  );

  Episode copyWith({
    int? id,
    String? name,
    String? airDate,
    String? episode,
    List<String>? characters,
    String? url,
    DateTime? created,
  }) {
    return Episode(
      id ?? this.id,
      name ?? this.name,
      airDate ?? this.airDate,
      episode ?? this.episode,
      characters ?? this.characters,
      url ?? this.url,
      created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'airDate': airDate,
      'episode': episode,
      'characters': characters,
      'url': url,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['airDate'] ?? '',
      map['episode'] ?? '',
      List<String>.from(map['characters']),
      map['url'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Episode.fromJson(String source) =>
      Episode.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Episode(id: $id, name: $name, airDate: $airDate, episode: $episode, characters: $characters, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Episode &&
        other.id == id &&
        other.name == name &&
        other.airDate == airDate &&
        other.episode == episode &&
        listEquals(other.characters, characters) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        airDate.hashCode ^
        episode.hashCode ^
        characters.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}
