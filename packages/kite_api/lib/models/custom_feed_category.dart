import 'package:json_annotation/json_annotation.dart';
import 'package:kite_api/feed_category.dart';

part 'custom_feed_category.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CustomFeedCategory extends FeedCategory{
  final List<String> feeds;

  const CustomFeedCategory(super.name, this.feeds);

  factory CustomFeedCategory.fromJson(String name, Map<String, dynamic> json) {
    return CustomFeedCategory(
      name,
      List<String>.from(json['feeds'] as List),
    );
  }

  Map<String, dynamic> toJson() => {
    'feeds': feeds,
  };
}