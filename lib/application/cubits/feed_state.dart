import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kite_api/feed_category.dart';
import 'package:kite_api/models/feed.dart';
import 'package:kite_app/application/cubits/status.dart';

part 'feed_state.g.dart';

@JsonSerializable()
class FeedState extends Equatable {
  final FeedCategory feedCategory;
  final Feed? feed;
  final Status status;
  final Exception? error;

  const FeedState({
    this.feedCategory = FeedCategory.world,
    this.feed,
    this.error,
    this.status = Status.initial});

  FeedState copyWith({FeedCategory? feedCategory,
    Feed? feed,
    Exception? error,
    Status? status}) {
    return FeedState(
        feedCategory: feedCategory ?? this.feedCategory,
        feed: feed ?? this.feed,
        error: error,
        status: status ?? this.status);
  }

  Map<String, dynamic> toJson() => _$FeedStateToJson(this);

  static FeedState fromJson(Map<String, dynamic> json) =>
      _$FeedStateFromJson(json);

  @override
  List<Object?> get props => [feedCategory.name, feed?.timestamp];
}
