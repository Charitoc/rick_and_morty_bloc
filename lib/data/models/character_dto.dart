import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_bloc/data/models/location.dart';

class CharacterDTO extends Equatable {
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
  final DateTime created;

  CharacterDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  CharacterDTO copyWith({
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
    DateTime? created,
  }) {
    return CharacterDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
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
      'created': created.toIso8601String(),
    };
  }

  factory CharacterDTO.fromMap(Map<String, dynamic> map) {
    return CharacterDTO(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      origin: Location.fromMap(map['origin']),
      location: Location.fromMap(map['location']),
      image: map['image'] ?? '',
      episode: List<String>.from(map['episode']),
      url: map['url'] ?? '',
      created: DateTime.parse(map['created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDTO.fromJson(String source) =>
      CharacterDTO.fromMap(json.decode(source));

  @override
  List<Object?> get props => [id, name, gender, created];
}
