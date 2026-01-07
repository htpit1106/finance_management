import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';

class TargetButton extends StatelessWidget {
  final int percent;
  final String targetName;
  final double minHeigh;
  final double minWidth;

  const TargetButton({
    super.key,
    this.percent = 100,
    this.minWidth = 150,
    this.minHeigh = 150,
    this.targetName = "My Target",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minimumSize: Size(minWidth, minHeigh),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                ),
                child: Center(child: Text("$percent%", style: AppTextStyle.whiteS15Bold)),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: percent / 100,
                  color: AppColors.oceanBlue,
                  strokeWidth: 5,

                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(targetName, style: AppTextStyle.whiteS15Medium)
        ],
      ),
    );
  }
}
