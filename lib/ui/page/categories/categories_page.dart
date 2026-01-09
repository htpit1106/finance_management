import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/repository/category_repository.dart';
import 'package:finance_management/ui/page/categories/categories_cubit.dart';
import 'package:finance_management/ui/page/categories/categories_navigator.dart';
import 'package:finance_management/ui/page/categories/category_state.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:finance_management/utils/categories_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => CategoriesCubit(
        categoryRepository: context.read<CategoryRepository>(),
        navigator: CategoriesNavigator(context: context),
      ),
      child: CategoriesPageChild(),
    );
  }
}

class CategoriesPageChild extends StatefulWidget {
  const CategoriesPageChild({super.key});

  @override
  State<CategoriesPageChild> createState() => _CategoriesPageChildState();
}

class _CategoriesPageChildState extends State<CategoriesPageChild> {
  late final CategoriesCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<CategoriesCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.fetchCategories();
    });



  }
  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 320,
      header: _buildHeaderPage(),
      body: _buildGridViewCategory(context),
    );
  }

  _buildHeaderPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 40),
              Center(child: Text("Categories", style: AppTextStyle.greenDarkBoldS20)),

              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppIcons.icNotification),
                iconSize: 40,
              ),
            ],
          ),
        ),
        AppHeader(),
      ],
    );
  }

  _buildGridViewCategory(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoryState>(
      buildWhen: (previous, current) => previous.categories != current.categories,

      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: state.categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = state.categories[index];
            // category to enum to get icon
            return _iconButtonLabel(
              context,
              iconPath: CategoriesUtils.getIcon(category.name?? ""),
              label: category.name ?? "unKnow",
              onTap: () {
                cubit.selectCategory(category);
                cubit.onPressCategoriesBtn();
              },
            );
          },
        );
      },
    );
  }

  _iconButtonLabel(BuildContext context, {required String iconPath, required String label, required VoidCallback onTap}) {
    return Column(
      children: [
        AppIconButton(
          iconPath: iconPath,
          size: 90,
          isActive: false,
          onTap: onTap
        ),
        Text(label, style: AppTextStyle.greenDarkS14),
      ],
    );
  }
}
