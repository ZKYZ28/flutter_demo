import 'package:flutter/material.dart';
import 'package:welcome_sprint/routes/app_router.gr.dart';
import '../../../routes/app_router.dart';

class BottomNavBar extends StatefulWidget {
  final AppRouter appRouter;

  const BottomNavBar({
    required this.appRouter,
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      widget.appRouter.push(const HomeRoute());
    }else if (index == 1) {
      widget.appRouter.push(const TeamRoute());
    } else if (index == 2) {
      widget.appRouter.push(const MapRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF1E3A8A),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      iconSize: 22,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded),
          label: 'Team',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
