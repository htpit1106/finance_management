import 'package:flutter/material.dart';

class Utils {

  Utils._();

  static Future<int?> showDiaLogDropDownPicker(
      BuildContext context,
      List<String> listItemText,
      ) async {
    return showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Month"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listItemText.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listItemText[index]),
                  onTap: () {
                    Navigator.pop(context, index);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }


}

// update month{
// thay doi focusedMoth,
// update year: thay doi focused year
//
// }