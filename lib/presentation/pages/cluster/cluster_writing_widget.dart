import 'package:flutter/cupertino.dart';

class ClusterWritingWidget extends StatelessWidget {
  final String title;
  final String? text;
  final double? paddingBottom;

  const ClusterWritingWidget({super.key, required this.title, this.text, this.paddingBottom});

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