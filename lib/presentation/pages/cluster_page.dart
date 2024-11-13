import 'package:flutter/material.dart';
import 'package:kite_api/models/news_cluster.dart';

class ClusterPage extends StatelessWidget {
  static const String route = '/cluster-page';
  final NewsCluster cluster;
  final int index;

  const ClusterPage({super.key, required this.cluster, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(cluster.title),
        Text(cluster.category),
      ],
    ),);
  }
  
}