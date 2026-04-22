import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/ui/page/analysis/analysis_page.dart';
import 'package:finance_management/ui/page/categories/categories_page.dart';
import 'package:finance_management/ui/page/home/home_page.dart';
import 'package:finance_management/ui/page/main/main_cubit.dart';
import 'package:finance_management/ui/page/main/main_tap.dart';
import 'package:finance_management/ui/page/profile/profile_page.dart';
import 'package:finance_management/ui/page/transaction/transaction_page.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required Widget child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MainCubit();
      },
      child: MainPageChild(),
    );
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
  late final MainCubit _cubit;
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
    _cubit = context.read<MainCubit>();
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
        extendBody: true,
        body: _buildPageView(), bottomNavigationBar: _buildBottomNavigationBar());
  }

  Widget _buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        _cubit.switchTap(index);
      },
      children: pageList,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: AppColors.navBottonBg,
      ),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          pageController.jumpToPage(state.selectedIndex);
        },
        bloc: _cubit,
        buildWhen: (previous, current) => previous.selectedIndex != current.selectedIndex,
        builder: (context, state) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < tabs.length; i++)
              AppIconButton(
                onTap: () {
                  _cubit.switchTap(i);
                },
                iconPath: tabs[i].icon,
                isActive: state.selectedIndex == i,
                iconColor: AppColors.blackIcon,
                bgDefaultColor: AppColors.transparent,
                bgPressedColor: AppColors.caribbeanGreen,
              ),
          ],
        ),
      ),
    );
  }
}
