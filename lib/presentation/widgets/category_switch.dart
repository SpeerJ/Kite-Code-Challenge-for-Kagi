import 'package:flutter/material.dart';
import 'package:kite_api/feed_category.dart';

class CategorySwitch extends StatelessWidget {
  final FeedCategory category;
  final Widget body;

  const CategorySwitch({
    super.key,
    required this.category,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Leading arrow (left)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          category.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Handle forward navigation
            },
          ),
        ],
      ),
      // Scrollable content
      body: body
    );
  }
}