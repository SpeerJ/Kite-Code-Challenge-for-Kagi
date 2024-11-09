import 'package:json_annotation/json_annotation.dart';
import 'package:kite_api/models/article.dart';
import 'package:kite_api/models/text_with_sources.dart';

import 'domain.dart';
import 'empty_string_fix.dart';

part 'news_cluster.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class NewsCluster {
  final int clusterNumber;

  final int uniqueDomains;

  final int numberOfTitles;

  final String category;
  final String title;

  final String shortSummary;

  final String didYouKnow;

  final List<String> talkingPoints;

  final String quote;

  final String quoteAuthor;

  final String quoteSourceUrl;

  final String quoteSourceDomain;

  final String location;
  final List<TextWithSources> perspectives;
  final String emoji;

  final String geopoliticalContext;

  final String historicalBackground;

  @JsonKey(fromJson: EmptyStringFix.toStringList)
  final List<String> internationalReactions;

  final String humanitarianImpact;

  final String economicImplications;

  @JsonKey(fromJson: EmptyStringFix.toStringList)
  final List<String> timeline;

  final String futureOutlook;

  // The intended type here is unknown since it always seems to be empty
  final List<String> keyPlayers;

  @JsonKey(fromJson: EmptyStringFix.toStringList)
  final List<String> technicalDetails;

  final String businessAngleText;

  final List<String> businessAnglePoints;

  @JsonKey(fromJson: EmptyStringFix.toStringList)
  final List<String> userActionItems;

  // The intended type here is unknown since it always seems to be empty
  final List<String> scientificSignificance;

  final List<String> travelAdvisory;

  final String destinationHighlights;

  final String culinarySignificance;

  final List<String> performanceStatistics;

  final String leagueStandings;

  final String diyTips;

  final String designPrinciples;

  final String userExperienceImpact;

  final List<String> gameplayMechanics;

  final List<String> industryImpact;

  final String technicalSpecifications;

  final List<Article> articles;

  final List<Domain> domains;

  NewsCluster({
    required this.clusterNumber,
    required this.uniqueDomains,
    required this.numberOfTitles,
    required this.category,
    required this.title,
    required this.shortSummary,
    required this.didYouKnow,
    required this.talkingPoints,
    required this.quote,
    required this.quoteAuthor,
    required this.quoteSourceUrl,
    required this.quoteSourceDomain,
    required this.location,
    required this.perspectives,
    required this.emoji,
    required this.geopoliticalContext,
    required this.historicalBackground,
    required this.internationalReactions,
    required this.humanitarianImpact,
    required this.economicImplications,
    required this.timeline,
    required this.futureOutlook,
    required this.keyPlayers,
    required this.technicalDetails,
    required this.businessAngleText,
    required this.businessAnglePoints,
    required this.userActionItems,
    required this.scientificSignificance,
    required this.travelAdvisory,
    required this.destinationHighlights,
    required this.culinarySignificance,
    required this.performanceStatistics,
    required this.leagueStandings,
    required this.diyTips,
    required this.designPrinciples,
    required this.userExperienceImpact,
    required this.gameplayMechanics,
    required this.industryImpact,
    required this.technicalSpecifications,
    required this.articles,
    required this.domains,
  });

  factory NewsCluster.fromJson(Map<String, dynamic> json) =>
      _$NewsClusterFromJson(json);

  Map<String, dynamic> toJson() => _$NewsClusterToJson(this);
}
