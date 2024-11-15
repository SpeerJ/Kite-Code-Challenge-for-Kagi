import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kite_api/models/news_cluster.dart';

import '../../enums/kagi_colors.dart';

class ClusterHeadlineWidget extends StatelessWidget {
  final NewsCluster cluster;
  final int index;
  final bool hideSocialMedia;
  Color get color =>
      KagiColors.categoryColors[index % KagiColors.categoryColors.length].color;

  const ClusterHeadlineWidget({super.key, required this.cluster, required this.index, required this.hideSocialMedia});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
    ]);
  }

}