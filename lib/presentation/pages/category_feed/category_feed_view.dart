import 'package:flutter/material.dart';
import 'package:kite_api/models/feed.dart';
import 'package:kite_app/presentation/pages/category_feed/cluster_view.dart';

class CategoryFeedView extends StatelessWidget {
  final Feed feed;
  const CategoryFeedView({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
     return ClusterView(cluster: feed.clusters[index]);
    });
  }
}