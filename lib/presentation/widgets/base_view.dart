import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kite_app/presentation/widgets/positioned_menu_widget.dart';

import '../../application/cubits/feed_cubit.dart';
import '../../application/cubits/feed_state.dart';
import 'black_menu_bar.dart';

class BaseView extends StatelessWidget {

  final Widget child;

  const BaseView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(builder: (context, state) {
        return Stack(children: [
          Positioned(top: 40, bottom: 0, left: 0, right: 0, child: child),
          const BlackMenuBar(),
          const PositionedMenuWidget(),
        ]);
    });
  }
}
