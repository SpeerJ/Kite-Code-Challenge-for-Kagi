// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_feed_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomFeedCategory _$CustomFeedCategoryFromJson(Map<String, dynamic> json) =>
    CustomFeedCategory(
      json['name'] as String,
      (json['feeds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CustomFeedCategoryToJson(CustomFeedCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'feeds': instance.feeds,
    };
