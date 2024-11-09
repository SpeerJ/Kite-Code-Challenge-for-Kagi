import 'package:kite_api/models/news_cluster.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CategoryModel {
  final String category;
  final int timestamp;
  final int read;
  final List<NewsCluster> clusters;

  const CategoryModel({
    required this.category,
    required this.timestamp,
    required this.read,
    required this.clusters
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}