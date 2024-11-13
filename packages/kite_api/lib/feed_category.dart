import 'package:json_annotation/json_annotation.dart';

part 'feed_category.g.dart';

@JsonSerializable()
class FeedCategory {
  static const world = FeedCategory('world');
  static const science = FeedCategory('science');
  static const tech = FeedCategory('tech');
  static const builtIn = [world, science, tech];
  static const defaultCategory = world;

  final String name;

  String get title => name[0].toUpperCase() + name.substring(1);

  factory FeedCategory.fromJson(Map<String, dynamic> json) =>
      _$FeedCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FeedCategoryToJson(this);

  const FeedCategory(this.name);
}
