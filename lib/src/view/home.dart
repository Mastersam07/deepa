import 'package:flutter/cupertino.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabState = CupertinoTabPage.of(context);

    return CupertinoTabScaffold(
      controller: tabState.controller,
      tabBuilder: tabState.tabBuilder,
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(CupertinoIcons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'Support',
            icon: Icon(CupertinoIcons.chat_bubble),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.profile_circled),
          ),
        ],
      ),
    );
  }
}
