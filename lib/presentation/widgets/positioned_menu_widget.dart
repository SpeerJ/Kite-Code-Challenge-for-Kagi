import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/showing_settings_cubit.dart';
import '../utils/formatting.dart';

class PositionedMenuWidget extends StatelessWidget {
  static const List<String> dummyMenuItems = [
    'Account',
    'Settings',
    'Interest',
    'Order'
  ];

  static const List<String> dummyKiteItems = [
    'Top Stories',
    'Technology',
    'Science',
    'Design & UX',
    'Artificial Intelligence'
  ];

  const PositionedMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowingSettingsCubit, bool>(
        builder: (context, showingSettings) {
      if (!showingSettings) return Container();

      return Positioned(
          top: 0,
          left: 0,
          child: Material(
            textStyle: const TextStyle(color: Colors.white),
            child: Container(
                color: Colors.black,
                height: Formatting.screenHeight(context),
                width: 330,
                child: Column(children: [
                  GestureDetector(
                      onTap: () =>
                          context.read<ShowingSettingsCubit>().toggle(),
                      child: Container(color: Colors.white, height: 67, width: 330)),
                  Expanded(
                      child: ListView.separated(
                    itemCount: dummyMenuItems.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == (dummyMenuItems.length)) {
                        return Container(height: 67);
                      }

                      return ListTile(
                        title: Text(
                          dummyMenuItems[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  )),
                  Expanded(
                      child: ListView.separated(
                    itemCount: dummyKiteItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(dummyKiteItems[index],
                            style: const TextStyle(color: Colors.white)),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ))
                ])),
          ));
    });
  }
}
