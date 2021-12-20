import 'dart:convert';

class Location {
  final String name;
  final String url;

  Location(
    this.name,
    this.url,
  );

  Location copyWith({
    String? name,
    String? url,
  }) {
    return Location(
      name ?? this.name,
      url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      map['name'] ?? '',
      map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
