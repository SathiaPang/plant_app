import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screens/cart_page.dart';
import 'package:plant_app/ui/screens/favorite_page.dart';
import 'package:plant_app/ui/screens/home_page.dart';
import 'package:plant_app/ui/screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  //List of the pages
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];
  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  //List of page title
  List<String> titlelist = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titlelist[_bottomNavIndex],
              style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10.0,
      ),
    );
  }
}
