import 'package:deepa/src/state/appstate.dart';
import 'package:flutter/material.dart';

class NotAuthPage extends StatelessWidget {
  const NotAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 64),
            TextButton.icon(
              onPressed: () => AppState.instance.loginUser(),
              icon: const Icon(Icons.lock),
              label: const Text('Login to access this feature'),
            )
          ],
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Page not found')),
    );
  }
}
