import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_morty_bloc/data/models/location.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  // final DateTime created;

  Character(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    // this.created,
  );

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Location? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    // DateTime? created,
  }) {
    return Character(
      id ?? this.id,
      name ?? this.name,
      status ?? this.status,
      species ?? this.species,
      type ?? this.type,
      gender ?? this.gender,
      origin ?? this.origin,
      location ?? this.location,
      image ?? this.image,
      episode ?? this.episode,
      url ?? this.url,
      // created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toMap(),
      'location': location.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      // 'created': created.millisecondsSinceEpoch,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['status'] ?? '',
      map['species'] ?? '',
      map['type'] ?? '',
      map['gender'] ?? '',
      Location.fromMap(map['origin']),
      Location.fromMap(map['location']),
      map['image'] ?? '',
      List<String>.from(map['episode']),
      map['url'] ?? '',
      // DateTime.fromMillisecondsSinceEpoch(map['created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.type == type &&
        other.gender == gender &&
        other.origin == origin &&
        other.location == location &&
        other.image == image &&
        listEquals(other.episode, episode) &&
        other.url == url;
    // other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        origin.hashCode ^
        location.hashCode ^
        image.hashCode ^
        episode.hashCode ^
        url.hashCode;
    // created.hashCode;
  }
}
