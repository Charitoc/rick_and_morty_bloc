import 'dart:convert';

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info(
    this.count,
    this.pages,
    this.next,
    this.prev,
  );

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) {
    return Info(
      count ?? this.count,
      pages ?? this.pages,
      next ?? this.next,
      prev ?? this.prev,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      map['count']?.toInt() ?? 0,
      map['pages']?.toInt() ?? 0,
      map['next'] ?? '',
      map['prev'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) => Info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Info(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Info &&
        other.count == count &&
        other.pages == pages &&
        other.next == next &&
        other.prev == prev;
  }

  @override
  int get hashCode {
    return count.hashCode ^ pages.hashCode ^ next.hashCode ^ prev.hashCode;
  }
}
