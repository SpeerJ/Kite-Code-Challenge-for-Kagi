import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Source {
  final String name;
  final String url;

  const Source(this.name, this.url);

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}