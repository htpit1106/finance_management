import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUtil {
  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> init(String url, String anonKey) async {
    await Supabase.initialize(url: url, anonKey: anonKey);
  }
}
