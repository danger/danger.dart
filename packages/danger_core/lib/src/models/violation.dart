import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'violation.g.dart';

enum ViolationType {
  @JsonValue('message')
  message,
  @JsonValue('warn')
  warn,

  @JsonValue('fail')
  fail,

  @JsonValue('markdown')
  markdown,
}

@JsonSerializable()
class Violation {
  /// The string representation
  final String message;

  /// Optional path to the file
  @JsonKey(includeIfNull: false)
  final String file;

  /// Optional line in the file
  @JsonKey(includeIfNull: false)
  final int line;

  /// Optional icon for table (Only valid for messages)
  @JsonKey(includeIfNull: false)
  final String icon;

  factory Violation.fromJson(Map<String, dynamic> json) =>
      _$ViolationFromJson(json);

  Violation({this.message, this.file, this.line, this.icon});
  Map<String, dynamic> toJson() => _$ViolationToJson(this);
}

@JsonSerializable()
class WrappedViolation {
  final ViolationType type;
  final Violation violation;

  WrappedViolation({this.type, this.violation});

  factory WrappedViolation.fromJson(Map<String, dynamic> json) =>
      _$WrappedViolationFromJson(json);
  Map<String, dynamic> toJson() => _$WrappedViolationToJson(this);
}
