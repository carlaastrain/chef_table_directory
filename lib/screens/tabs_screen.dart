import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tabs extends StatelessWidget {
  final GoRouterState state;
  final Widget child;
  const Tabs({
    super.key,
    required this.state,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.indigo[400],
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Boxes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).location;
  if (location.startsWith('/home')) {
    return 0;
  }
  if (location.startsWith('/map')) {
    return 1;
  }
  if (location.startsWith('/favorites')) {
    return 2;
  }
  if (location.startsWith('/login')) {
    return 3;
  }
  if (location.startsWith('/loggedin')) {
    return 3;
  }
  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      GoRouter.of(context).go('/home');
      break;
    case 1:
      GoRouter.of(context).go('/map');
      break;
    case 2:
      GoRouter.of(context).go('/favorites');
      break;
    case 3:
      GoRouter.of(context).go('/login');
      break;
    case 4:
      GoRouter.of(context).go('/loggedin');
      break;
  }
}
