import 'package:flutter/material.dart';
import 'package:kite_api/models/news_cluster.dart';
import 'package:kite_app/presentation/pages/category_feed/cluster_view.dart';

import '../utils/formatting.dart';

class ClusterPage extends StatelessWidget {
  static const String route = '/cluster-page';
  final NewsCluster cluster;
  final int index;
  final DateTime dateTime;

  const ClusterPage(
      {super.key,
      required this.cluster,
      required this.index,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      child: Builder(builder: (context) {
                        return Text(Formatting.displayDate(dateTime));
                      })),
                  const Divider(),
                  Container(height: 11)
                ],
              ),
              ClusterView(
                cluster: cluster,
                index: index,
                hideSocialMedia: true,
                dateTime: dateTime,
              )
            ],
          )),
    );
  }
}
