import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kite_api/models/news_cluster.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';

import '../cluster_page.dart';

class ClusterView extends StatelessWidget {
  final NewsCluster cluster;
  final int index;

  Color get color =>
      KagiColors.categoryColors[index % KagiColors.categoryColors.length].color;

  const ClusterView({super.key, required this.cluster, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ClusterPage(cluster: cluster, index: index),
        ));
      },
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Icon(Icons.circle_rounded, color: color, size: 7),
              Container(
                width: 7,
              ),
              Text(
                cluster.category,
                style:
                    TextStyle(color: color, fontSize: 12, fontFamily: 'Arial'),
              ),
              Container(
                width: 12,
              ),
              SvgPicture.asset(
                'assets/icons/stack-2.svg',
                height: 19,
              ),
              Container(
                width: 4.5,
              ),
              Text('${cluster.numberOfTitles} Sources',
                  style: TextStyle(color: KagiColors.gray.color, fontSize: 12)),
              Expanded(child: Container()),
              SvgPicture.asset(
                'assets/icons/Share.svg',
                height: 19,
                colorFilter: ColorFilter.mode(KagiColors.gray.color, BlendMode.srcIn),
              ),
              Container(width: 11,),
              Icon(Icons.check_circle, color: KagiColors.lightGray.color, size: 19,)
            ]),
            Text(
              cluster.title,
              style: const TextStyle(fontSize: 22, fontFamily: 'Arial'),
            ),
          ]),
    );
  }
}
