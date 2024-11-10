import 'package:flutter/material.dart';
import 'package:kite_api/feed_category.dart';

import '../widgets/category_switch.dart';

class CategoryFeedPage extends StatelessWidget {
  final List<FeedCategory> categories;
  final int categoryIndex;

  const CategoryFeedPage({
    super.key,
    required this.categories,
    required this.categoryIndex
  });

  @override
  Widget build(BuildContext context) {
    return CategorySwitch(category: categories[categoryIndex], body: Text('HELLO'));
  }
}