import 'package:flutter/material.dart';
import 'package:kite_api/models/text_with_sources.dart';

import '../../enums/kagi_colors.dart';
import '../widgets/source_widget.dart';

class PerspectivesWidget extends StatelessWidget {
  static final titleRegex = RegExp(r'(.*):(.*)');

  final List<TextWithSources> perspectives;
  final double? paddingBottom;

  const PerspectivesWidget(
      {super.key, required this.perspectives, this.paddingBottom});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Perspectives', style: TextStyle(fontSize: 22)),
        Container(
          height: 12,
        ),
        SizedBox(
            height: 232,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: perspectives.length,
                itemBuilder: (context, index) {
                  final perspective = perspectives[index];

                  final perspectiveGiver =
                      titleRegex.firstMatch(perspective.text)?.group(1);
                  final perspectiveText =
                      titleRegex.firstMatch(perspective.text)?.group(2);
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                          width: 222,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                            color: KagiColors.alternativeLightGrayBackground.color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${perspectiveGiver ?? ''}:',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Container(height: 11),
                              Text(perspectiveText ?? ''),
                              Expanded(child: Container()),
                              SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                      itemCount: perspective.sources.length,
                                      itemBuilder: (context, sourceIndex) {
                                        final source =
                                            perspective.sources[sourceIndex];
                                        return SourceWidget(source: source);
                                      }))
                            ],
                          )));
                })),
        Container(
          height: paddingBottom,
        )
      ],
    );
  }
}
