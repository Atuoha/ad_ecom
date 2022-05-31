import 'package:ad_ecom_ui/screen/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color.dart';
import '../screen/favorite_screen.dart';
import '../screen/product_screen.dart';
import '../screen/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;
  final List _pages = const [
    HomeScreen(),
    ProductScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: yellowDeep,
        unselectedItemColor: greyAccent,
        showSelectedLabels: false,
        // showUnselectedLabels:false,
        selectedIconTheme: const IconThemeData(color: yellowDeep),
        currentIndex: pageIndex,
        onTap: changePage,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              'assets/icons/home.png',
              width: 20,
              color: pageIndex == 0 ? yellowDeep : greyAccent
            ),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: Image.asset(
              'assets/icons/menu.png',
              width: 20,
               color: pageIndex == 1 ? yellowDeep : greyAccent
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Image.asset(
              'assets/icons/heart.png',
              width: 20,
               color: pageIndex == 2 ? yellowDeep : greyAccent
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              'assets/icons/user.png',
              width: 20,
               color: pageIndex == 3 ? yellowDeep : greyAccent
            ),
          ),
        ],
      ),
      backgroundColor: themeColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: themeColor,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: RichText(
          text: const TextSpan(
            text: 'Howdy, What Are You Looking For? 👀',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Badge(
                badgeColor: yellowDeep,
                badgeContent: const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: _pages[pageIndex],
      ),
    );
  }
}
