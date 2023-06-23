import 'dart:developer' as developer;

import 'package:deepa/src/state/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'src/view/view.dart';

final routemaster = RoutemasterDelegate(
  routesBuilder: (context) {
    final state = Provider.of<AppState>(context);
    developer.log('State: ${state.isLoggedIn}', name: 'State Change');
    return RouteMap(
      onUnknownRoute: (_) => const Redirect('/404'),
      routes: {
        '/': (info) => const CupertinoTabPage(
              child: HomePage(),
              paths: ['/product', '/search', '/orders', '/support', '/profile'],
            ),
        '/product': (_) => const MaterialPage(child: ProductListing()),
        '/product/:id': (info) =>
            MaterialPage(child: ProductDetails(id: info.pathParameters['id'])),
        '/search': (_) => const MaterialPage(child: SearchPage()),
        '/orders': (_) => state.isLoggedIn
            ? const MaterialPage(child: OrdersPage())
            : const MaterialPage(child: NotAuthPage()),
        '/support': (_) => const MaterialPage(child: SupportPage()),
        '/profile': (_) => state.isLoggedIn
            ? const MaterialPage(child: ProfilePage())
            : const MaterialPage(child: NotAuthPage()),
        '/no-auth': (_) => const MaterialPage(child: NotAuthPage()),
        '/404': (_) => const MaterialPage(child: NotFoundPage()),
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
