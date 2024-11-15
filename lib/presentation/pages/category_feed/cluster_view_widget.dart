import 'package:flutter/material.dart';
import 'package:kite_api/models/news_cluster.dart';

import '../cluster_page.dart';
import '../widgets/cluster_headline_widget.dart';

/// Individual Cluster, a specific new story and it's articles.
class ClusterSummaryWidget extends StatelessWidget {
  final NewsCluster cluster;
  final int index;
  final bool hideSocialMedia;
  final DateTime dateTime;

  const ClusterSummaryWidget({super.key, required this.cluster, required this.index, this.hideSocialMedia = false, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => ClusterPage(cluster: cluster, index: index, dateTime: dateTime,),
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          )
        );
      },
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClusterHeadlineWidget(cluster: cluster, index: index, hideSocialMedia: hideSocialMedia,),
            Container(height: 15),
            Text(
              cluster.title,
              style: const TextStyle(fontSize: 22, fontFamily: 'Arial'),
            ),
          ]),
    );
  }
}
