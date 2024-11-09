import 'package:json_annotation/json_annotation.dart';

part 'domain.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Domain {
  final String name;
  final String favicon;

  const Domain(this.name, this.favicon);

  factory Domain.fromJson(Map<String, dynamic> json) =>
      _$DomainFromJson(json);

  Map<String, dynamic> toJson() => _$DomainToJson(this);
}