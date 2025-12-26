import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/ui/page/analysis/analysis_page.dart';
import 'package:finance_management/ui/page/categories/categories_page.dart';
import 'package:finance_management/ui/page/home/home_page.dart';
import 'package:finance_management/ui/page/main/main_tap.dart';
import 'package:finance_management/ui/page/profile/profile_page.dart';
import 'package:finance_management/ui/page/transaction/transaction_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPageChild();
  }
}

class MainPageChild extends StatefulWidget {
  const MainPageChild({super.key});

  @override
  State<MainPageChild> createState() => _MainPageChildState();
}

class _MainPageChildState extends State<MainPageChild> {
  late List<Widget> pageList;
  late PageController pageController;
  final tabs = [
    MainTab.home,
    MainTab.analysis,
    MainTab.transaction,
    MainTab.categories,
    MainTab.profile,
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pageList = [
      const HomePage(),
      const AnalysisPage(),
      const TransactionPage(),
      const CategoriesPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),

    );
  }
  Widget _buildPageView() {
     return PageView(
       controller: pageController,
       onPageChanged: (index){
         setState(() {

         });
       },
       children: pageList,
     );
  }
  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        // border radius
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: AppColors.navBottonBg
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var tab in tabs)
              tab.tab
          ],
        
        ),
      ),
    );
  }
}
