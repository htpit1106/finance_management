import 'package:finance_management/configs/app_config.dart';
import 'package:finance_management/model/entity/profile_entitty/profile_entity.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';

class ProfileClient {
  final supabaseClient = SupabaseUtil.client;

  // add new profile
  Future<void> addProfile({required ProfileEntity profile}) async {
    try {
      await supabaseClient.from("profile").insert(profile.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateProfile({required ProfileEntity profile}) async {
    try {
      if (profile.id == null) return;
      await supabaseClient
          .from(AppConstants.tableNameProfile)
          .update(profile.toJson())
          .eq("id", profile.id!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get profile by id
  Future<ProfileEntity?> getProfileById(int id) async {
    try {
      final data = await supabaseClient.from("profile").select().eq("id", id).single();
      return ProfileEntity.fromJson(data);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
