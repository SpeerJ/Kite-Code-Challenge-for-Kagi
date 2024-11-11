import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kite_api/feed_category.dart';

import '../../application/cubits/feed_cubit.dart';
import '../../application/cubits/feed_state.dart';
import '../../application/cubits/status.dart';
import '../widgets/category_switch.dart';
import 'category_feed/category_feed_view.dart';
import 'category_feed/empty.dart';
import 'category_feed/failure.dart';

class CategoryFeedPage extends StatelessWidget {
  const CategoryFeedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(builder: (context, state) {
      return switch (state.status) {
        Status.initial => const CircularProgressIndicator(),
        Status.loading => const CircularProgressIndicator(),
        Status.empty => const EmptyCategoryFeed(),
        Status.failure => const FailureCategoryFeed(),
        Status.success => CategorySwitch(category: state.feedCategory, body: CategoryFeedView(feed: state.feed!))
      };
    });
  }
}