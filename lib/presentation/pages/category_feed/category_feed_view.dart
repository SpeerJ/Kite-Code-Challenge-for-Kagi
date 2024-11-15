import 'package:flutter/material.dart';
import 'package:kite_api/models/feed.dart';
import 'package:kite_app/presentation/pages/category_feed/cluster_view.dart';
import 'package:kite_app/presentation/utils/formatting.dart';

class CategoryFeedView extends StatelessWidget {
  final Feed feed;

  const CategoryFeedView({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            itemCount: feed.clusters.length + 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      child: Builder(builder: (context) {
                        if (index == 0) {
                          return Text(Formatting.displayDate(feed.date));
                        }
                        return ClusterView(
                          cluster: feed.clusters[index - 1],
                          index: index,
                          dateTime: feed.date,
                        );
                      })),
                  const Divider(),
                ],
              );
            }));
  }
}
