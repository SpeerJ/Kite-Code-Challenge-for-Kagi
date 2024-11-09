import 'package:json_annotation/json_annotation.dart';
import 'package:kite_api/models/source.dart';

part 'text_with_sources.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class TextWithSources {
  final String text;
  final List<Source> sources;

  const TextWithSources(this.text, this.sources);

  factory TextWithSources.fromJson(Map<String, dynamic> json) =>
      _$TextWithSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$TextWithSourcesToJson(this);
}