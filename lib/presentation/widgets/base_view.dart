import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubits/feed_cubit.dart';
import '../../application/cubits/feed_state.dart';
import 'category_switch.dart';



class BaseView extends StatelessWidget {
  final Widget child;

  const BaseView({super.key, required this.child});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(builder: (context, state) {
      return CategorySwitch(
          category: state.feedCategory,
          body: child
      );
    });
  }
}