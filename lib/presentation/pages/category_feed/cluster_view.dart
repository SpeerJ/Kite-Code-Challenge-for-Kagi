import 'package:flutter/material.dart';
import 'package:kite_api/models/news_cluster.dart';

class ClusterView extends StatelessWidget {
  final NewsCluster cluster;

  const ClusterView({super.key, required this.cluster});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(cluster.category),
      Text(cluster.title),
    ]);
  }
}