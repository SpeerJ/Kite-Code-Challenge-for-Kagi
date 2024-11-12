import 'package:kite_api/feed_category.dart';
import 'package:kite_api/kite_api.dart';
import 'package:kite_app/application/cubits/status.dart';

import 'feed_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


class FeedCubit extends HydratedCubit<FeedState>{
  final KiteApiClient _apiClient;

  FeedCubit(this._apiClient) : super(const FeedState()) {
    fetchFeedCategories();
  }

  Future<void> fetchFeed(FeedCategory category) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final feed = await _apiClient.getCategory(category);

      emit(state.copyWith(status: Status.success, feedCategory: category, feed: feed));
    } on NotFoundException catch () {
      emit(state.copyWith(status: Status.empty, feedCategory: category, feed: null));
    }
    on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, feedCategory: category, error: e));
    }
  }

  Future<void> fetchFeedCategories() async {
    emit(state.copyWith(status: Status.loading));

    try {
      final feedCategories = await _apiClient.getCustomFeeds();
      emit(state.copyWith(status: Status.empty, categories: feedCategories.toList()));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, error: e));
    }
  }

  Future<void> refreshFeed() async {
    if (state.status != Status.success) return;
    if (state.feed == null) return;

    return fetchFeed(state.feedCategory);
  }

  @override
  FeedState? fromJson(Map<String, dynamic> json) => FeedState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(FeedState state) => state.toJson();
}