import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/pages/calendrier/CalendrierPage.dart';
import 'package:oasis_coiffure/pages/coiffure/CoiffurePage.dart';
import 'package:oasis_coiffure/pages/demarrage/HomePage.dart';
import 'package:oasis_coiffure/pages/profil/ProfilePage.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentTab = 0;
  final List<Widget> pages = [
    HomePage(),
    CoiffurePage(),
    CalendrierPage(),
    ProfilePage(),
  ];

  Widget currentScreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR.withOpacity(4.sp),
      //body: PageStorage(bucket: bucket, child: currentScreen),
      body: IndexedStack(index: currentTab,children: pages,),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: ColorPages.COLOR_NOIR,
      currentIndex: currentTab,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorPages.COLOR_BLANC,
      selectedItemColor: ColorPages.COLOR_DORE_FONCE,
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedLabelStyle: TextStyle(fontSize: 13.sp),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              size: 21.sp,
              color: currentTab == 0
                  ? ColorPages.COLOR_DORE_FONCE
                  : ColorPages.COLOR_BLANC),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,
                size: 21.sp,
                color: currentTab == 1
                    ? ColorPages.COLOR_DORE_FONCE
                    : ColorPages.COLOR_BLANC),
            label: 'Recherche'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month,
                size: 21.sp,
                color: currentTab == 2
                    ? ColorPages.COLOR_DORE_FONCE
                    : ColorPages.COLOR_BLANC),
            label: 'Calendrier'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person,
                size: 21.sp,
                color: currentTab == 3
                    ? ColorPages.COLOR_DORE_FONCE
                    : ColorPages.COLOR_BLANC),
            label: 'Moi'),
      ],
      onTap: (index) {
        setState(() {
          currentTab = index;
        });
      },
    );
  }
}
