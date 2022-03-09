import 'dart:convert';

class Fact {
  final String title;
  final String image;
  final int length;
  Fact({
    this.title = '',
    this.image = '',
    this.length = 0,
  });

  Fact copyWith({
    String? title,
    String? image,
    int? length,
  }) {
    return Fact(
      title: title ?? this.title,
      image: image ?? this.image,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fact': title,
      'image': image,
      'length': length,
    };
  }

  factory Fact.fromMap(Map<String, dynamic> map) {
    return Fact(
      title: map['fact'] ?? '',
      image: map['image'] ?? '',
      length: map['length']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fact.fromJson(String source) => Fact.fromMap(json.decode(source));

  @override
  String toString() => 'Fact(title: $title, image: $image, length: $length)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Fact && other.title == title && other.image == image && other.length == length;
  }

  @override
  int get hashCode => title.hashCode ^ image.hashCode ^ length.hashCode;
}
