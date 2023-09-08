import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/bag/components/bag_view.dart';
import 'package:sneakers_app/view/home/components/home_view.dart';
import 'package:sneakers_app/view/user_profile/user_profile_view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({
    Key? key,
  }) : super(key: key);

  // const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // ignore: prefer_final_fields
  PageController _pageController = PageController();
  List<Widget> _screans = [
    HomeView(),
    BagView(),
    UserProfileView(),
  ];
  int _selecktedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selecktedIndex = index;
    });
    // _pageController.jumpToPage(_selecktedIndex);
    _pageController.animateToPage(_selecktedIndex,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screans,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selecktedIndex,
        onTap: _onItemTapped,
        iconSize: 27.0,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
          ),
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
