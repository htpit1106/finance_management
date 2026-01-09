import 'package:finance_management/app.dart';
import 'package:finance_management/configs/app_config.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
final supabase = Supabase.instance.client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  await SupabaseUtil.init(AppConstants.urlSupabase, AppConstants.anonKeySupabase);
  runApp(FinanceApp());
}



