import 'package:finance_management/common/app_icons.dart';

class CategoriesUtils {
  CategoriesUtils._();
  // get icon
  static String getIcon(String category) {
    switch (category) {
      case 'Food':
        return AppIcons.icFood;
      case 'Transport':
        return AppIcons.icTransport;
      case 'Medicine':
        return AppIcons.icMedicine;
      case 'Groceries':
        return AppIcons.icGroceries;
      case 'Rent':
        return AppIcons.icRent;
      case 'Gifts':
        return AppIcons.icGifts;
      case 'Entertainment':
        return AppIcons.icEntertainment;
      case 'Savings':
        return AppIcons.icSavings;
      case 'Car':
        return AppIcons.icCar;
      case 'Travel':
        return AppIcons.icTravel;
      case 'New House':
        return AppIcons.icHouse;
      case 'Wedding':
        return AppIcons.icWedding;

      default:
        return AppIcons.icMore;
    }
  }
}
