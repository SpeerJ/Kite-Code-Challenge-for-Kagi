import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:kite_api/models/news_cluster.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';
import 'package:kite_app/presentation/pages/category_feed/cluster_view.dart';
import 'package:kite_app/presentation/pages/cluster/image_switcher.dart';
import 'package:kite_app/presentation/pages/cluster/cluster_writing.dart';
import 'package:kite_app/presentation/pages/cluster/international_reactions.dart';
import 'package:kite_app/presentation/pages/cluster/perspectives.dart';
import 'package:kite_app/presentation/pages/cluster/timeline.dart';

import '../utils/formatting.dart';
import 'cluster/sources_widget.dart';

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
            shrinkWrap: true,
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
              ),
              Container(height: 11),
              Text(cluster.shortSummary),
              Container(height: 22),
              ImageSwitcher(imageUrls: cluster.images),
              Container(height: 22),

              /// Highlights
              const Text('Highlights', style: TextStyle(fontSize: 22)),
              Container(height: 12),
              ListView.separated(
                  // Using ShrinkWrapped Listview for ease of separator Builder
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine()),
                  itemCount: cluster.highlights.length,
                  itemBuilder: (context, i) => Column(children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 13,
                                backgroundColor: KagiColors.yellow.color,
                                child: Text(index.toString())),
                            Container(
                              width: 11,
                            ),
                            Text("${cluster.highlights[i]['name']!}:"),
                          ],
                        ),
                        Container(height: 11),
                        Text(cluster.highlights[i]['description']!),
                      ])),
              const DottedLine(),
              Container(height: 48),

              /// Quotes
              Container(
                decoration: BoxDecoration(
                  color: KagiColors.lightGrayBackground.color,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.format_quote, size: 19),
                    Container(height: 13),
                    Text(cluster.quote),
                    Container(height: 13),
                    Text(cluster.quoteAuthor),
                    Container(height: 13),
                    Text(cluster.quoteSourceDomain),
                  ],
                ),
              ),
              Container(height: 48),

              /// Quote photo
              Builder(builder: (context) {
                final image = cluster.quotePhoto;
                if (image == null) return Container();

                return Column(
                  children: [
                    Image.network(
                      cluster.quotePhoto!,
                      fit: BoxFit.cover,
                    ),
                    Container(height: 48),
                  ],
                );
              }),

              /// Perspective
              Perspectives(perspectives: cluster.perspectives, paddingBottom: 48,),

              /// Geopolitical Context
              ClusterWriting(
                  title: 'Geopolitical Context',
                  text: cluster.geopoliticalContext,
                  paddingBottom: 48),

              /// Historical Background
              ClusterWriting(
                  title: 'Historical Background',
                  text: cluster.historicalBackground,
                  paddingBottom: 48),

              /// International reaction
              InternationalReactions(internationalReactions: cluster.internationalReactions, paddingBottom: 48,),

              /// Economic Implications
              ClusterWriting(
                  title: 'Economic Implications',
                  text: cluster.economicImplications,
                  paddingBottom: 48),

              /// Humanitarian Impact
              ClusterWriting(
                  title: 'Humanitarian Impact',
                  text: cluster.humanitarianImpact,
                  paddingBottom: 48),

              /// Entities
              // Todo: Test, nothing showing up
              Builder(builder: (context) {
                if (cluster.keyPlayers.isEmpty) return Container();

                return Column(children: [
                  Text('Entities', style: TextStyle(fontSize: 22)),
                  ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // todo map over these in the builder and make matching a condition of displaying the element
                        final players = RegExp(r'(.+):(.+)')
                            .firstMatch(cluster.keyPlayers[index]);

                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Text(players?.group(1) ?? '', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(players?.group(2) ?? '',),
                              ],
                            ));
                      })
                ],);
              }),

              /// Timeline of Events
              Timeline(
                  timeline: cluster.timeline,
                  paddingBottom: 48
              ),
              /// Future Outlook
              ClusterWriting(
                  title: 'Future Outlook',
                  text: cluster.futureOutlook,
                  paddingBottom: 48),
              /// Sources
              SourcesWidget(articles: cluster.articles, paddingBottom: 48)
              /// Action Items
            ],
          )),
    );
  }
}
