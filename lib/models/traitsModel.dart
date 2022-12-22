// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostResponse {
  final String? id;
  final double? extroversion;
  final double? agreeableness;
  final double? openness;
  final double? conscientiousness;
  final double? neuroticism;
  PostResponse({
    this.id,
    this.extroversion,
    this.agreeableness,
    this.openness,
    this.conscientiousness,
    this.neuroticism,
  });

  double getAvg() {
    final avg = (agreeableness! +
            conscientiousness! +
            extroversion! +
            openness! +
            neuroticism!) /
        5;
    return double.parse(avg.toStringAsFixed(2));
  }

  PostResponse copyWith({
    String? id,
    double? extroversion,
    double? agreeableness,
    double? openness,
    double? conscientiousness,
    double? neuroticism,
  }) {
    return PostResponse(
      id: id ?? this.id,
      extroversion: extroversion ?? this.extroversion,
      agreeableness: agreeableness ?? this.agreeableness,
      openness: openness ?? this.openness,
      conscientiousness: conscientiousness ?? this.conscientiousness,
      neuroticism: neuroticism ?? this.neuroticism,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'extroversion': extroversion,
      'agreeableness': agreeableness,
      'openness': openness,
      'conscientiousness': conscientiousness,
      'neuroticism': neuroticism,
    };
  }

  factory PostResponse.fromMap(Map<String, dynamic> map) {
    return PostResponse(
      id: map['id'] != null ? map['id'] as String : null,
      extroversion: map['extroversion'] != null
          ? double.parse(map['extroversion']!.toStringAsFixed(2))
          : 0.0,
      agreeableness: map['agreeableness'] != null
          ? double.parse(map['agreeableness']!.toStringAsFixed(2))
          : 0.0,
      openness: map['openness'] != null
          ? double.parse(map['openness']!.toStringAsFixed(2))
          : 0.0,
      conscientiousness: map['conscientiousness'] != null
          ? double.parse(map['conscientiousness']!.toStringAsFixed(2))
          : 0.0,
      neuroticism: map['neuroticism'] != null
          ? double.parse(map['neuroticism']!.toStringAsFixed(2))
          : 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostResponse.fromJson(String source) =>
      PostResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostResponse(id: $id, extroversion: $extroversion, agreeableness: $agreeableness, openness: $openness, conscientiousness: $conscientiousness, neuroticism: $neuroticism )';
  }

  @override
  bool operator ==(covariant PostResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.extroversion == extroversion &&
        other.agreeableness == agreeableness &&
        other.openness == openness &&
        other.conscientiousness == conscientiousness &&
        other.neuroticism == neuroticism;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        extroversion.hashCode ^
        agreeableness.hashCode ^
        openness.hashCode ^
        conscientiousness.hashCode ^
        neuroticism.hashCode;
  }
}
