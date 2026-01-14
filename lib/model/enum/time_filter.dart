enum TimeFilter { daily, weekly, monthly }

// get time from (daily: trong ngay , weakly : now() - tinh tu dau tuan hien tai,
// monthly - trong thang hien tai - tu dau thang

extension TimeFilterExtension on TimeFilter {
  DateTime getDateTime() {
    switch (this) {
      case TimeFilter.daily:
        return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
      case TimeFilter.weekly:
        final startOfWeek = DateTime.now().subtract(Duration(days: DateTime.now().weekday));
        return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0);
      case TimeFilter.monthly:
        return DateTime(DateTime.now().year, DateTime.now().month, 1);
    }
  }
}
