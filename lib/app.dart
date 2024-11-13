import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kite_api/kite_api.dart';
import 'package:kite_app/application/cubits/feed_cubit.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';
import 'package:kite_app/presentation/pages/category_feed_page.dart';
import 'package:kite_app/presentation/widgets/base_view.dart';

class App extends StatelessWidget {
  final KiteApiClient _apiClient;

  const App(this._apiClient, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FeedCubit(_apiClient),
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: KagiColors.yellow.color),
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