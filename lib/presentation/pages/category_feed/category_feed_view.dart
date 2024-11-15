import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kite_api/feed_category.dart';
import 'package:kite_api/models/feed.dart';
import 'package:kite_app/presentation/pages/category_feed/cluster_view_widget.dart';
import 'package:kite_app/presentation/utils/formatting.dart';

import '../../../application/cubits/feed_cubit.dart';
import '../../../application/cubits/feed_state.dart';
import '../../enums/kagi_colors.dart';

/// Shows all of the clusters(stories) of a particular category(world, sci, tech, etc..)
class CategoryFeedView extends StatelessWidget {
  final Feed feed;

  const CategoryFeedView({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 108,
            title: Column(
              children: [
                Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset('assets/images/kite logo.png'),
                        Image.asset('assets/images/kite text.png'),
                        Expanded(child: Container()),
                        SvgPicture.asset(
                          'assets/icons/Settings-cog.svg',
                          height: 24,
                        )
                      ],
                    )),
                Container(
                    color: KagiColors.alternativeLightGrayBackground.color,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BlocBuilder<FeedCubit, FeedState>(
                        builder: (context, state) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: FeedCategory.builtIn.length,
                            // To switch to using custom categories
                            // context
                            //     .read<FeedCubit>()
                            //     .state
                            //     .categories
                            //     .length,
                            itemBuilder: (context, index) {
                              final category = context
                                  .read<FeedCubit>()
                                  .state
                                  .categories[index];

                              return Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: state.feedCategory.name ==
                                                  category.name
                                              ? BorderSide(
                                                  color:
                                                      KagiColors.yellow.color,
                                                  width: 4)
                                              : BorderSide.none)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                      child: GestureDetector(
                                          onTap: () => context
                                              .read<FeedCubit>()
                                              .fetchFeed(category),
                                          child: Text(category.title))));
                            })))
              ],
            )),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.builder(
                itemCount: feed.clusters.length + 1,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11.0),
                          child: Builder(builder: (context) {
                            if (index == 0) {
                              return Text(Formatting.displayDate(feed.date));
                            }
                            return ClusterSummaryWidget(
                              cluster: feed.clusters[index - 1],
                              index: index,
                              dateTime: feed.date,
                            );
                          })),
                      const Divider(),
                    ],
                  );
                })));
  }
}
