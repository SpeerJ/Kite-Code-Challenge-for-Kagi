import 'package:flutter/material.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';

class LoadingCategoryFeed extends StatelessWidget {
  const LoadingCategoryFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: KagiColors.yellow.color,
              )),
        ));
  }
}
