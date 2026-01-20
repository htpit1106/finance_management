import 'package:finance_management/common/app_icons.dart';

enum SavingCategories { travel, newHouse, car, wedding, other }

extension ExtensionSavingCategories on SavingCategories {
  String get iconPath {
    switch (this) {
      case SavingCategories.travel:
        return AppIcons.icTravel;
      case SavingCategories.newHouse:
        return AppIcons.icHouse;
      case SavingCategories.car:
        return AppIcons.icCar;
      case SavingCategories.wedding:
        return AppIcons.icWedding;
      default:
        return AppIcons.icAddMore;
    }
  }
  static SavingCategories fromApiName(String? name){
    switch (name?.trim()) {
      case "Travel":
        return SavingCategories.travel;
      case "New House":
        return SavingCategories.newHouse;
        case "Car":
        return SavingCategories.car;
      case "Wedding":
        return SavingCategories.wedding;
      default:
        return SavingCategories.other;

    }
  }
}
