import 'package:flutter/cupertino.dart';

class ClusterWriting extends StatelessWidget {
  final String title;
  final String? text;
  final double? paddingBottom;

  const ClusterWriting({super.key, required this.title, this.text, this.paddingBottom});

  @override
  Widget build(BuildContext context) {
    if(text == null || text!.isEmpty) return Container();

    return Column(children: [
      Text(title, style: const TextStyle(fontSize: 22)),
      Text(text!),
      Container(height: paddingBottom),
    ],);

  }

}