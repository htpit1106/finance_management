import 'package:finance_management/common/app_colors.dart';
import 'package:flutter/material.dart';

import 'filter_button.dart';

class ListTimeFilter extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onTap;
  final List<String> listTime;

  const ListTimeFilter({super.key, this.selectedIndex = 0, this.onTap, required this.listTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.navBottonBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < listTime.length; i++)
                Expanded(
                  flex: 1,
                  child: FilterButton(
                    text: listTime[i],
                    isActive: selectedIndex == i,
                    onTap: () => onTap?.call(i),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
