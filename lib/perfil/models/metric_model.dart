import 'dart:convert';

import 'package:flutter/material.dart';

class MetricModel {

  final String name;
  final String alias;
  final Color color;
  final int index;
  final bool show;
  
  MetricModel({
    required this.name,
    required this.alias,
    required this.color,
    required this.index,
    required this.show,
  });

  MetricModel copyWith({
    String? name,
    String? alias,
    Color? color,
    int? index,
    bool? show,
  }) {
    return MetricModel(
      name: name ?? this.name,
      alias: alias ?? this.alias,
      color: color ?? this.color,
      index: index ?? this.index,
      show: show ?? this.show,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'alias': alias,
      'color': color.value,
      'index': index,
      'show': show,
    };
  }

  factory MetricModel.fromMap(Map<String, dynamic> map) {
    return MetricModel(
      name: map['name'] ?? '',
      alias: map['alias'] ?? '',
      color: Color(map['color']),
      index: map['index']?.toInt() ?? 0,
      show: map['show'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetricModel.fromJson(String source) => MetricModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MetricModel(name: $name, alias: $alias, color: $color, index: $index, show: $show)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MetricModel &&
      other.name == name &&
      other.alias == alias &&
      other.color == color &&
      other.index == index &&
      other.show == show;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      alias.hashCode ^
      color.hashCode ^
      index.hashCode ^
      show.hashCode;
  }
}
