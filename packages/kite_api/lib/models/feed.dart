import 'package:json_annotation/json_annotation.dart';
import 'package:kite_api/models/news_cluster.dart';

part 'feed.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
/// A group of news stories centered around a particular category(world, sci, tech, etc..)
class Feed {
  final String category;
  final int timestamp;
  final int read;
  final List<NewsCluster> clusters;

  DateTime get date => DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000000);

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