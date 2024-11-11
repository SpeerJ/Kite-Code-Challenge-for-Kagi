// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      category: json['category'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      read: (json['read'] as num).toInt(),
      clusters: (json['clusters'] as List<dynamic>)
          .map((e) => NewsCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'category': instance.category,
      'timestamp': instance.timestamp,
      'read': instance.read,
      'clusters': instance.clusters,
    };
