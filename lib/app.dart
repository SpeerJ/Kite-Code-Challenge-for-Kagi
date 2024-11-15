import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kite_api/kite_api.dart';
import 'package:kite_app/application/cubits/feed_cubit.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';
import 'package:kite_app/presentation/pages/category_feed_page.dart';
import 'package:kite_app/presentation/widgets/base_view.dart';

import 'application/cubits/showing_settings_cubit.dart';

class App extends StatelessWidget {
  final KiteApiClient _apiClient;

  const App(this._apiClient, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShowingSettingsCubit(false)),
        BlocProvider(create: (_) => FeedCubit(_apiClient))
        ],
      child: const AppView(),
    );
  }

}

class AppView extends StatelessWidget {

  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: KagiColors.yellow.color).copyWith(surface: Colors.white),
        useMaterial3: true,
      ),
      builder: (context, child) => BaseView(child: child ?? Container()),
      initialRoute: CategoryFeedPage.route,
      routes: {
        CategoryFeedPage.route: (context) => const CategoryFeedPage(),
      },
    );
  }
}