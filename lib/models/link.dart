import 'dart:convert';

class Link {
  final String url;
  final String label;
  final bool active;
  Link({
    this.url = '',
    this.label = '',
    this.active = false,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      url: map['url'] ?? '',
      label: map['label'] ?? '',
      active: map['active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Link.fromJson(String source) => Link.fromMap(json.decode(source));

  @override
  String toString() => 'Link(url: $url, label: $label, active: $active)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Link && other.url == url && other.label == label && other.active == active;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode ^ active.hashCode;
}
