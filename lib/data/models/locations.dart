import 'dart:convert';

import 'package:flutter/foundation.dart';

class SingleLocation {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  SingleLocation(
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  );

  SingleLocation copyWith({
    int? id,
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
    String? url,
    DateTime? created,
  }) {
    return SingleLocation(
      id ?? this.id,
      name ?? this.name,
      type ?? this.type,
      dimension ?? this.dimension,
      residents ?? this.residents,
      url ?? this.url,
      created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'dimension': dimension,
      'residents': residents,
      'url': url,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory SingleLocation.fromMap(Map<String, dynamic> map) {
    return SingleLocation(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['type'] ?? '',
      map['dimension'] ?? '',
      List<String>.from(map['residents']),
      map['url'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleLocation.fromJson(String source) =>
      SingleLocation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SingleLocation(id: $id, name: $name, type: $type, dimension: $dimension, residents: $residents, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleLocation &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.dimension == dimension &&
        listEquals(other.residents, residents) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        dimension.hashCode ^
        residents.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}
