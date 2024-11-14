import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kite_api/models/article.dart';

import '../views/source_widget.dart';

class ShowingAllSourcesCubit extends Cubit<bool> {
  ShowingAllSourcesCubit() : super(false);

  void toggle() {
    emit(!state);
  }
}

class SourcesWidget extends StatelessWidget {
  final List<Article> articles;
  final double paddingBottom;
  static const String chevronDown = 'assets/icons/Chevron down.svg';
  static const String chevronUp = 'assets/icons/Chevron up.svg';

  const SourcesWidget(
      {super.key, required this.articles, required this.paddingBottom});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) return Container();

    print("articles.length: ${articles.length}");

    return BlocProvider(
        create: (_) => ShowingAllSourcesCubit(),
        child: BlocBuilder<ShowingAllSourcesCubit, bool>(
            builder: (context, showingAll) {
          return Column(
            children: [
              Row(children: [
                const Text('Sources', style: TextStyle(fontSize: 22)),
                Expanded(child: Container()),
                InkWell(
                    onTap: () => context.read<ShowingAllSourcesCubit>().toggle(),
                    child: Row(children: [
                      Text(showingAll ? 'Hide' : 'Show', style: TextStyle(fontSize: 14)),
                      const SizedBox(width: 4),
                      SvgPicture.asset(showingAll ? chevronUp : chevronDown,
                          width: 12)
                    ]))
              ]),
              Container(height: 12),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 6,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 13),
                  itemCount: showingAll ? articles.length : min(8, articles.length),
                  itemBuilder: (context, index) {
                    final article = articles[index];

                    return SizedBox(
                        height: 25,
                        child: Row(children: [
                          SourceWidget(source: article.toSource())
                        ]));
                  }),
              Container(height: paddingBottom)
            ],
          );
        }));
  }
}
