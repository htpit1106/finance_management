import 'package:finance_management/model/profile_entitty/profile_entity.dart';
import 'package:finance_management/network/profile_client.dart';

abstract class ProfileRepository {
  final profileClient = ProfileClient();

  Future<void> updateProfile({required ProfileEntity profile});

  Future<ProfileEntity?> getProfileById(int id);

  Future<void> addProfile({required ProfileEntity profile});
}

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<void> addProfile({required ProfileEntity profile}) async {
    await profileClient.addProfile(profile: profile);
  }

  @override
  Future<ProfileEntity?> getProfileById(int id) async {
    final profile = await profileClient.getProfileById(id);
    return profile;
  }

  @override
  Future<void> updateProfile({required ProfileEntity profile}) async {
    await profileClient.updateProfile(profile: profile);
  }
}
