import 'package:flutter/material.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';

class Timeline extends StatelessWidget {
  final List<String> timeline;
  final double paddingBottom;

  const Timeline(
      {super.key, required this.timeline, required this.paddingBottom});

  @override
  Widget build(BuildContext context) {
    if (timeline.isEmpty) return Container();

    return Column(
      children: [
        const Text('Timeline', style: TextStyle(fontSize: 22)),
        ListView.separated(
            shrinkWrap: true,
            itemCount: timeline.length,
            separatorBuilder: (context, index) {
              return Container(height: 12);
            },
            itemBuilder: (context, index) {
              final event = RegExp(r'(.*)::(.*)').firstMatch(timeline[index]);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    CircleAvatar(
                        radius: 13,
                        backgroundColor: KagiColors.timelineBlue.color,
                        child: Text(index.toString())),
                    Container(width: 2),
                    Text(event?.group(1) ?? '',
                        style: const TextStyle(fontSize: 16)),
                  ]),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: KagiColors.timelineBlue.color))
                      ),
                      child: Column(children: [
                        Text(event?.group(2) ?? '', style: TextStyle(fontSize: 14),)]
                      ))
                ],
              );
            }),
        Container(height: paddingBottom)
      ],
    );
  }
}
