import 'package:flutter/material.dart';
import 'package:kylashoes/screens/bag/bag_screen.dart';
import 'package:kylashoes/screens/favorite/favorite_screen.dart';
import 'package:kylashoes/screens/home/home_screen.dart';
import 'package:kylashoes/screens/profile/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.commute),
              label: 'Commute',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Saved',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Saved',
            ),
          ],
        ),
        body: const <Widget>[
          HomeScreen(),
          FavoriteScreen(),
          BagScreen(),
          ProfileScreen(),
        ][currentPageIndex],
      ),
    );
  }
}
