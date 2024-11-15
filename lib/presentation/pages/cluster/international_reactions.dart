import 'package:flutter/cupertino.dart';

import '../../enums/kagi_colors.dart';

class InternationalReactions extends StatelessWidget {
  final List<String> internationalReactions;
  final double? paddingBottom;

  const InternationalReactions({super.key, required this.internationalReactions, this.paddingBottom});

  @override
  Widget build(BuildContext context) {
      if (internationalReactions.isEmpty) return Container();



      return Column( children: [
        const Text('International Reactions', style: TextStyle(fontSize: 22)),
        Container(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: internationalReactions.length,
          itemBuilder: (context, index) {
            final reactions = RegExp(r'(.+):(.+)')
                .firstMatch(internationalReactions[index]);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: KagiColors.alternativeLightGrayBackground.color,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reactions?.group(1) ?? '',
                        style: const TextStyle(fontSize: 16)),
                    Text(reactions?.group(2) ?? '')
                  ],
                ),
              ),
            );
          }),
    Container(height: paddingBottom),
    ]);
  }

}