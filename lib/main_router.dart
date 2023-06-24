import 'dart:developer' as developer;

import 'package:deepa/routes.dart';
import 'package:deepa/src/state/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'src/view_router/view.dart';

final routemaster = RoutemasterDelegate(
  routesBuilder: (context) {
    final state = Provider.of<AppState>(context);
    developer.log('State: ${state.isLoggedIn}', name: 'State Change');
    return RouteMap(
      onUnknownRoute: (_) => const Redirect('/404'),
      routes: {
        homeViewRoute: (_) => const CupertinoTabPage(
              child: HomePage(),
              paths: ['/product', '/search', '/orders', '/support', '/profile'],
            ),
        productViewRoute: (_) => const MaterialPage(child: ProductListing()),
        productDetailsViewRoute: (info) =>
            MaterialPage(child: ProductDetails(id: info.pathParameters['id'])),
        searchViewRoute: (_) => const MaterialPage(child: SearchPage()),
        ordersViewRoute: (_) => state.isLoggedIn
            ? const MaterialPage(child: OrdersPage())
            : const MaterialPage(child: NotAuthPage()),
        supportViewRoute: (_) => const MaterialPage(child: SupportPage()),
        profileViewRoute: (_) => state.isLoggedIn
            ? const MaterialPage(child: ProfilePage())
            : const MaterialPage(child: NotAuthPage()),
        noAuthViewRoute: (_) => const MaterialPage(child: NotAuthPage()),
        notFoundViewRoute: (_) => const MaterialPage(child: NotFoundPage()),
      },
    );
  },
);

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
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerDelegate: routemaster,
        routeInformationParser: const RoutemasterParser(),
      ),
    );
  }
}
