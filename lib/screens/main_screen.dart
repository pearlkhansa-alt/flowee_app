import 'package:flowee_app/screens/favorite_screen.dart';
import 'package:flowee_app/screens/home_screen.dart';
import 'package:flowee_app/widgets/bottom_nav_item.dart';
import 'package:flowee_app/widgets/home_content_header.dart';
import 'package:flutter/material.dart';

//activity shell

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// kita menggunakan index
// shell adalah metode untuk menampung dua atau lebih screen pada aplikasi agar dapat bernavigasi melalui index dan tidak bernavigasi melalu navigator
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const _screens = [HomeScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       * extendBody: true akan membuat 'body' bisa ter scroll SAMPAI KE BELAKANG navbar bawah yang floating(melayang)
       * bukan berhenti tepat di atasnya.
       */
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            //horizontal
            children: [
              Expanded(
                child: BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  icon: Icons.favorite_rounded,
                  label: 'Favorite',
                  selected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
