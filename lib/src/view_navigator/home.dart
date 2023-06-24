import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state/appstate.dart';
import 'view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) => [
        const ProductListing(),
        const SearchPage(),
        context.read<AppState>().isLoggedIn
            ? const OrdersPage()
            : const NotAuthPage(),
        const SupportPage(),
        context.read<AppState>().isLoggedIn
            ? const ProfilePage()
            : const NotAuthPage(),
      ].elementAt(_page),
      tabBar: CupertinoTabBar(
        currentIndex: _page,
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
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
