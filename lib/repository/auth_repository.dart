import 'package:finance_management/network/auth_client.dart';

abstract class AuthRepository {
  final authClient = AuthClient();
  String? get userId;
  Future <bool> signIn(String email, String password);
  Future <bool> signUp(String email, String password);
  Future <void> logout();
}

class AuthRepositoryImpl extends AuthRepository{
  // get userId;
  @override
  String? get userId => authClient.userId;

  @override
  Future<void> logout() async {
     await authClient.signOut();
  }

  @override
  Future<bool> signIn(String email, String password) async {
    final result = await authClient.signIn(email, password);
    return result;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    final result = await authClient.signUp(email, password);
    return result;
  }

}