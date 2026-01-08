import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class ChartItem {
  final String day;
  final double income;
  final double expense;

  ChartItem(this.day, this.income, this.expense);
}

class IncomeExpenseChart extends StatelessWidget {
  const IncomeExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      ChartItem('Mon', 3000, 1200),
      ChartItem('Tue', 1000, 1000),
      ChartItem('Wed', 2800, 9000),
      ChartItem('Thu', 4500, 7000),
      ChartItem('Fri', 8000, 6),
      ChartItem('Sat', 900, 2000),
      ChartItem('Sun', 5500, 1000),
    ];


    return BarChart(
      BarChartData(
        maxY: 15000,
        barGroups: List.generate(data.length, (index) {
          final item = data[index];
          return BarChartGroupData(
            x: index,
            barsSpace: 4,

            barRods: [
              // income
              BarChartRodData(
                color: Colors.green,
                toY: item.income,
                width: 8,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4), topLeft: Radius.circular(4)),
              ),

              // expense
              BarChartRodData(
                toY: item.expense,
                width: 8,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4), topLeft: Radius.circular(4)),
                color: const Color(0xFF2979FF),
              ),
            ],
          );
        }),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(

            sideTitles: SideTitles(
              reservedSize: 30,
              showTitles: true,
                interval: 5000,
              getTitlesWidget: (value, _) {
                return Text(
                  "${(value.toInt() / 1000 ).toInt()} k",
                  style: AppTextStyle.oceanBlueS14Light,

                );
              }
            )
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return Text(
                  data[value.toInt()].day,
                  style: const TextStyle(fontSize: 12),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppColors.oceanBlue,
              strokeWidth: 0.5,
              dashArray: [5, 4],
            );
          }

        ),
        borderData: FlBorderData(show: true,
          border: Border(bottom: BorderSide(color: AppColors.void_, width: 2))
        ),
    ));
  }
}

// du lieu : income, expense, day,
