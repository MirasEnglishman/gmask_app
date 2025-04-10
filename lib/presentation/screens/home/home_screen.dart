import 'package:flutter/material.dart';
import 'package:gmask_app/presentation/screens/news/news_screen.dart';
import 'package:gmask_app/presentation/screens/market/market_screen.dart';
import 'package:gmask_app/presentation/screens/main/main_screen.dart';
import 'package:gmask_app/presentation/screens/profile/profile_screen.dart';
import 'package:gmask_app/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    MainScreen(),
    NewsScreen(),
    MarketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
