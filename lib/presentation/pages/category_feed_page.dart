
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kite_app/presentation/pages/category_feed/loading.dart';

import '../../application/cubits/feed_cubit.dart';
import '../../application/cubits/feed_state.dart';
import '../../application/cubits/status.dart';
import 'category_feed/category_feed_view.dart';
import 'category_feed/empty.dart';
import 'category_feed/failure.dart';

class CategoryFeedPage extends StatelessWidget {
  static const String route = '/';
  const CategoryFeedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (context, state) {
        return switch (state.status) {
          Status.initial => const LoadingCategoryFeed(),
          Status.loading => const LoadingCategoryFeed(),
          Status.empty => const EmptyCategoryFeed(),
          Status.failure => const FailureCategoryFeed(),
          Status.success => CategoryFeedView(feed: state.feed!)
        };
      },
    );
  }
}