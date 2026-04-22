import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/analysis/search/search_navigator.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_drop_down.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalendarPageChild();
  }
}

class CalendarPageChild extends StatefulWidget {
  const CalendarPageChild({super.key});

  @override
  State<CalendarPageChild> createState() => _CalendarPageChildState();
}

class _CalendarPageChildState extends State<CalendarPageChild> {
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  List<String> years = [
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
  ];

  final CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime(2026, 1, 1);
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 200,
      header: _buildHeader(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            _buildCalendar(),
            _buildListTransaction(),
            Row(
              children: [
                Expanded(
                  child: AppTextButton(
                    textButton: "Spend",
                    minHeight: 44,
                    backgroundColor: AppColors.lightGreenBtn,
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppTextButton(textButton: "Categories", minHeight: 44, onTap: () {}),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // hien thi arrow back
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              final navigator = SearchNavigator(context: context);
              navigator.goBack();
            },
            icon: SvgPicture.asset(
              AppIcons.icBack, // icon custom của bạn
            ),
          ),
          // icon  notification - right // trail
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.icNotification),
              iconSize: 40,
            ),
          ],
          title: Center(child: Text("Calendar", style: AppTextStyle.greenDarkBoldS20)),
        ),
      ],
    );
  }

  _buildCalendar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeaderCalender(),
        SizedBox(height: 20),

        TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,

          headerVisible: false,

          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay; // Cập nhật biến để Header vẽ lại text đúng tháng/năm
            });
          },

          // 2. Tùy chỉnh hàng Thứ trong tuần (Mon, Tue...)
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: AppTextStyle.oceanBlueS15Light,
            weekendStyle: AppTextStyle.oceanBlueS15Light,
          ),

          // 3. Tùy chỉnh giao diện các ngày
          calendarStyle: CalendarStyle(
            defaultTextStyle: AppTextStyle.greenDarkS14,
            weekendTextStyle: AppTextStyle.greenDarkS14,
            todayDecoration: BoxDecoration(color: AppColors.oceanBlue, shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
              color: AppColors.caribbeanGreen,
              shape: BoxShape.circle,
            ),
            outsideDaysVisible: true, // Ẩn các ngày của tháng trước/sau
          ),

          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
        ),

      ],
    );
  }

  _buildHeaderCalender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppDropDown(
          text: months[_focusedDay.month - 1],
          onTap: () async {
            final selectedIndex =
            await Utils.showDiaLogDropDownPicker(context, months);

            if (selectedIndex != null) {
              setState(() {
                _focusedDay = DateTime(
                  _focusedDay.year,
                  selectedIndex + 1,
                  _focusedDay.day,
                );
              });
            }
          },
        ),

        // AppDropDown(
        //   text: "April",
        //   onTap: () {
        //     Future<int?> selectedIndex = Utils.showDiaLogDropDownPicker(context, months);
        //     setState(() {
        //       _focusedDay = DateTime(_focusedDay.year, selectedIndex + 1, _focusedDay.day);
        //     });
        //   },
        // ),
        AppDropDown(text: "2023", onTap: () => Utils.showDiaLogDropDownPicker(context, years)),
      ],
    );
  }

  _buildListTransaction() {
    return Container();
  }

}
