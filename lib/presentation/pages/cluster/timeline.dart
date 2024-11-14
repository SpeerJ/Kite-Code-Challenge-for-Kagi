import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  final List<String> timeline;
  final double paddingBottom;

  const Timeline({super.key, required this.timeline, required this.paddingBottom});

  @override
  Widget build(BuildContext context) {
    if(timeline.isEmpty) return Container();

    return Column(
      children: [
        Text('Timeline', style: TextStyle(fontSize: 22)),
        ListView.separated(
          shrinkWrap: true,
            itemCount: timeline.length,
            separatorBuilder: (context, index) {
              return Container(height: 12);
            },
            itemBuilder: (context, index) {
              final event = RegExp(r'(.*)::(.*)').firstMatch(timeline[index]);

              return Column(
                children: [
                  // TODO: look up if there is a better way to do this.
                  // Maybe put into it's own widget
                  Row(children: [
                    Stack(children: [
                      Icon(Icons.circle, color: Colors.grey[300]),
                      Text(index.toString())
                    ]),
                    Text(event?.group(1) ?? ''),
                  ]),
                  Text(event?.group(2) ?? '')
                ],);
            }
        ),
        Container(height: paddingBottom)
      ],);
  }

}