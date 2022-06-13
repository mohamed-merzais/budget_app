import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_app/Screens/Budget.dart';
import 'package:budget_app/Screen/Transactions.dart';
import 'package:budget_app/Screens/Daily.dart';
import 'package:budget_app/Screens/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../Screens/Stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //what page user has selected
  int pageIndex = 0;
  //list of pages user is able to navigate between
  List<Widget> pages = [
    const Transactions(),
    const Stats(),
    const Budget(),
    const Daily()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),//gets different pages as body
        bottomNavigationBar: getFooter(),//gets the footer as bottomnavbar
        //floating middle button
        );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.calendar_clear,
      Ionicons.stats_chart,
      Ionicons.wallet,
      Ionicons.images_outline,

    ];

    return AnimatedBottomNavigationBar(
      // activeColor: primary,
      // splashColor: secondary,
      inactiveColor: Colors.blue.withOpacity(1),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
    );
  }
   selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}