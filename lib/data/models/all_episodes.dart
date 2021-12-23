import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rick_morty_bloc/data/models/episode.dart';

import 'info.dart';

class AllEpisodes {
  final Info info;
  final List<Episode> episodes;

  AllEpisodes(
    this.info,
    this.episodes,
  );

  AllEpisodes copyWith({
    Info? info,
    List<Episode>? episodes,
  }) {
    return AllEpisodes(
      info ?? this.info,
      episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'results': episodes.map((x) => x.toMap()).toList(),
    };
  }

  factory AllEpisodes.fromMap(Map<String, dynamic> map) {
    return AllEpisodes(
      Info.fromMap(map['info']),
      List<Episode>.from(map['results']?.map((x) => Episode.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllEpisodes.fromJson(String source) =>
      AllEpisodes.fromMap(json.decode(source));

  @override
  String toString() => 'AllEpisodes(info: $info, episodes: $episodes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllEpisodes &&
        other.info == info &&
        listEquals(other.episodes, episodes);
  }

  @override
  int get hashCode => info.hashCode ^ episodes.hashCode;
}
