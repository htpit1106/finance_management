import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthClient {
  final supabase = SupabaseUtil.client;

  // get user_id
  String? get userId => supabase.auth.currentUser?.id;

  // sign in
  Future<bool> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  // sign up
  Future<bool> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  // log out
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut(scope: SignOutScope.global);
    } catch (e) {
      debugPrint("error log out: $e");
    }
  }
  // TODO forgot password

  Future<String?> changePassword(String newPassword) async {
    final user = supabase.auth.currentUser;
    if (user == null) return "User not logged in";

    try {
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
      return null; // success
    } catch (e) {
      return e.toString();
    }
  }
}
