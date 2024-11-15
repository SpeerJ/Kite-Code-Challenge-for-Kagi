import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';

import '../../application/cubits/showing_settings_cubit.dart';

class BlackMenuBar extends StatelessWidget {
  final double barHeight;

  const BlackMenuBar({
    super.key,
    this.barHeight = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowingSettingsCubit, bool>(
        builder: (context, showingSettings) {
      return GestureDetector(
          onTap: () => context.read<ShowingSettingsCubit>().toggle(),
          child: Container(
            width: double.infinity,
            height: barHeight,
            color: KagiColors.darkGray.color
          ));
    });
  }
}
