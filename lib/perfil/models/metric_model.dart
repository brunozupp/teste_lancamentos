import 'dart:convert';

class MetricModel {

  final String name;
  final bool show;
  
  MetricModel({
    required this.name,
    required this.show,
  });

  MetricModel copyWith({
    String? name,
    bool? show,
  }) {
    return MetricModel(
      name: name ?? this.name,
      show: show ?? this.show,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'show': show,
    };
  }

  factory MetricModel.fromMap(Map<String, dynamic> map) {
    return MetricModel(
      name: map['name'] ?? '',
      show: map['show'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetricModel.fromJson(String source) => MetricModel.fromMap(json.decode(source));

  @override
  String toString() => 'MetricModel(name: $name, show: $show)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MetricModel &&
      other.name == name &&
      other.show == show;
  }

  @override
  int get hashCode => name.hashCode ^ show.hashCode;
}
