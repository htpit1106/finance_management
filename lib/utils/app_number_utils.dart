class AppNumberUtils {
  AppNumberUtils._();
  static String formatDoubleTwo(String number){
    double num = double.parse(number);
    return num.toStringAsFixed(2);

  }

}