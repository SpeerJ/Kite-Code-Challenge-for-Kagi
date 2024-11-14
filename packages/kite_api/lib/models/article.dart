import 'package:json_annotation/json_annotation.dart';
import 'package:kite_api/models/source.dart';

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

  // Article or domain should include a name attribute for the website
  Source toSource() => Source(domain, link);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
