import 'package:flutter/cupertino.dart';

class EmptyCategoryFeed extends StatelessWidget {
  const EmptyCategoryFeed({super.key});


  @override
  Widget build(BuildContext context) {
    return Text('No news found for this category');
  }
}