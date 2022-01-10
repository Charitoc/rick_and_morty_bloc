import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String location;
  final String image;
  final String firstEpisode;
  const Character({
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.location,
    required this.image,
    required this.firstEpisode,
  });

  Character copyWith({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    String? location,
    String? image,
    String? firstEpisode,
  }) {
    return Character(
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.name,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      image: image ?? this.image,
      firstEpisode: firstEpisode ?? this.firstEpisode,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, status, species, type, gender, location, image, firstEpisode];
}
