import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/home/widget/icon_text.dart';
import 'package:finance_management/ui/widgets/app_bar/app_bar_widget.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/button/target_button.dart';
import 'package:finance_management/ui/widgets/progress/goal_progress_bar.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'detail_savings_cubit.dart';
import 'detail_savings_navigator.dart';

class DetailSavingsPage extends StatelessWidget {
  const DetailSavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailSavingsCubit>(
      create: (context) => DetailSavingsCubit(
        navigator: DetailSavingsNavigator(context: context),
      ),
      child: DetailSavingsPageChild(),
    );
  }
}

class DetailSavingsPageChild extends StatefulWidget {
  const DetailSavingsPageChild({super.key});

  @override
  State<DetailSavingsPageChild> createState() => _DetailSavingsPageChildState();
}

class _DetailSavingsPageChildState extends State<DetailSavingsPageChild> {
  final percent = 0.2;
  late final DetailSavingsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<DetailSavingsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      heightHeader: 150,
      header: AppBarWidget(title: "Travel"),
      body: _buildBodyPage(),
    );
  }

  _buildBodyPage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconText(text: "Total Balance", fontSize: 11, icPath: AppIcons.icArrowUp),
                Text(
                  "    \$${AppNumberUtils.formatDoubleTwo("1817.45")}",
                  style: AppTextStyle.greenDarkBoldS20,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                IconText(text: "Total Expense", fontSize: 11, icPath: AppIcons.icArrowDown),
                Text(
                  "      \$${AppNumberUtils.formatDoubleTwo("1800")}",
                  style: AppTextStyle.greenDarkBoldS20,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            TargetButton(
              percent: 30,
              targetName: "Travel",
              minHeigh: 150,
              minWidth: 150,
              icon: SvgPicture.asset(AppIcons.icTravel),
            ),
          ],
        ),
        GoalProgressBar(
          percent: percent,
          primaryColor: AppColors.greenBtn,
          secondaryColor: AppColors.darkBackground,
        ),

        // <50% look good >= 50% look bd
        IconText(
          text: percent < 0.5
              ? "${(percent * 100).toInt()}% of your expenses, looks good."
              : "${(percent * 100).toInt()}% of your expenses, looks bad!!",
          icPath: AppIcons.icTick,
          fontSize: 15,
        ),
        Expanded(child: Container()),
        AppTextButton(
          text: "Add Saving",
          minHeight: 36,
          onTap: () {
            cubit.onPressAddExpenses();
          },
        ),
      ],
    );
  }
}
