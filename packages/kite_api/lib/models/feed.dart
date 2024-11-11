import 'package:kite_api/models/news_cluster.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Feed {
  final String category;
  final int timestamp;
  final int read;
  final List<NewsCluster> clusters;

  const Feed({
    required this.category,
    required this.timestamp,
    required this.read,
    required this.clusters
  });

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}