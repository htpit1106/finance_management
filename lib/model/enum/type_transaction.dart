import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:flutter/material.dart';

enum TypeTransaction { income, expense, saving }

extension TypeTransactionX on TypeTransaction {
  /// income, saving => +
  /// expense => -
  bool get isPositive =>
      this == TypeTransaction.income || this == TypeTransaction.saving;

  /// + $1,000.00  /  - $500.00
  String formatAmount(double amount) {
    final value = AppNumberUtils.formatDoubleTwo(amount);
    return "${isPositive ? '' : '-'} \$$value";
  }

  /// Màu hiển thị tiền
  TextStyle get amountTextStyle {
    switch (this) {
      case TypeTransaction.income:
      case TypeTransaction.saving:
        return AppTextStyle.greenDarkBoldS15;
      case TypeTransaction.expense:
        return AppTextStyle.oceanBlueS15Light;
    }
  }

  /// Icon (nếu cần dùng trong list)
  IconData get icon {
    switch (this) {
      case TypeTransaction.income:
        return Icons.arrow_downward;
      case TypeTransaction.saving:
        return Icons.savings;
      case TypeTransaction.expense:
        return Icons.arrow_upward;
    }
  }

  /// Text hiển thị loại giao dịch
  String get displayName {
    switch (this) {
      case TypeTransaction.income:
        return 'Income';
      case TypeTransaction.expense:
        return 'Expense';
      case TypeTransaction.saving:
        return 'Saving';
    }
  }
}
