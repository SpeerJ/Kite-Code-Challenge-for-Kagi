// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedState _$FeedStateFromJson(Map<String, dynamic> json) => FeedState(
      feedCategory: json['feedCategory'] == null
          ? FeedCategory.world
          : FeedCategory.fromJson(json['feedCategory'] as Map<String, dynamic>),
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
    };

const _$StatusEnumMap = {
  Status.initial: 'initial',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.failure: 'failure',
};
