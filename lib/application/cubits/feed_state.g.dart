// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedState _$FeedStateFromJson(Map<String, dynamic> json) => FeedState(
      feedCategory: json['feedCategory'] == null
          ? FeedCategory.world
          : FeedCategory.fromJson(json['feedCategory'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => FeedCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          FeedCategory.builtIn,
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']) ??
          Status.initial,
    );

Map<String, dynamic> _$FeedStateToJson(FeedState instance) => <String, dynamic>{
      'feedCategory': instance.feedCategory,
      'feed': instance.feed,
      'status': _$StatusEnumMap[instance.status]!,
      'categories': instance.categories,
    };

const _$StatusEnumMap = {
  Status.initial: 'initial',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.failure: 'failure',
};
