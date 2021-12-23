import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rick_morty_bloc/data/models/episode.dart';

import 'info.dart';

class AllEpisodes {
  final List<Episode> episodes;

  AllEpisodes(
    this.episodes,
  );

  AllEpisodes copyWith({
    List<Episode>? episodes,
  }) {
    return AllEpisodes(
      episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'episodes': episodes.map((x) => x.toMap()).toList(),
    };
  }

  factory AllEpisodes.fromMap(Map<String, dynamic> map) {
    return AllEpisodes(
      List<Episode>.from(map['episodes']?.map((x) => Episode.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllEpisodes.fromJson(String source) =>
      AllEpisodes.fromMap(json.decode(source));

  @override
  String toString() => 'AllEpisodes(episodes: $episodes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllEpisodes && listEquals(other.episodes, episodes);
  }

  @override
  int get hashCode => episodes.hashCode;
}
