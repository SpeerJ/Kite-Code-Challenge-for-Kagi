import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Article {
  final String title;
  final String link;
  final String domain;
  final String date;
  final String image;

  const Article(
      {required this.title,
      required this.link,
      required this.domain,
      required this.date,
      required this.image});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
