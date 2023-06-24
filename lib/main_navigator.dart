import 'dart:developer' as developer;

import 'package:deepa/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regex_router/regex_router.dart';

import 'src/state/appstate.dart';
import 'src/view_navigator/view.dart';

final router = RegexRouter.create({
  productDetailsViewRoute: (context, args) => ProductDetails(
        id: args["id"],
      ), // Access "object" arguments from `NavigatorState.pushNamed`.
});

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState.instance,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: <String, WidgetBuilder>{
          homeViewRoute: (BuildContext context) => const HomeView(),
          productViewRoute: (BuildContext context) => const ProductListing(),
          searchViewRoute: (BuildContext context) => const SearchPage(),
          ordersViewRoute: (BuildContext context) => const OrdersPage(),
          supportViewRoute: (BuildContext context) => const SupportPage(),
          profileViewRoute: (BuildContext context) => const ProfilePage(),
          notFoundViewRoute: (BuildContext context) => const NotFoundPage(),
          noAuthViewRoute: (BuildContext context) => const NotAuthPage(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
            settings: settings, builder: (_) => const NotFoundPage()),
        onGenerateRoute: (settings) {
          developer.log(settings.name ?? 'No name', name: 'Route Name');
          return router.generateRoute(settings);
        },
      ),
    );
  }
}
