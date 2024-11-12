import 'package:flutter/material.dart';

class LoadingCategoryFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
    );
  }
}