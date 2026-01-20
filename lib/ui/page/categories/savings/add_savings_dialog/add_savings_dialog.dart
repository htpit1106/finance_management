import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:flutter/material.dart';

class AddSavingsDialog extends StatelessWidget {
  const AddSavingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteIcon,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "New Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                AppTextFieldLabel(
                  labelText: "Expire Date",
                  hintText: "Ex: 30/APR/2023",
                  // controller: _dateController,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(AppIcons.icCalendar, width: 22, height: 22),
                  ),
                ),
                AppTextFieldLabel(
                  labelText: "Category Saving Name",
                  hintText: "Ex: New House",
                  // controller: _amountController,
                ),
                AppTextFieldLabel(
                  labelText: "Target Amount",
                  hintText: "Ex: \$3.53",
                  keyboardType: TextInputType.number,
        
                  // controller: _amountController,
                ),
        
                SizedBox(height: 10),
                AppTextButton(text: "Save", minWidth: 222, minHeight: 44, onTap: () {}),
                AppTextButton(
                  text: "Cancel",
                  minWidth: 222,
                  minHeight: 44,
                  onTap: () {},
                  backgroundColor: AppColors.lightGreenBtn,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
