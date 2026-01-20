import 'package:bloc/bloc.dart';
import 'package:finance_management/repository/auth_repository.dart';
import 'package:finance_management/repository/profile_repository.dart';
import 'package:finance_management/ui/page/auth/sign_up/sign_up_navigator.dart';
import 'package:finance_management/ui/page/auth/sign_up/sign_up_state.dart';

import '../../../../model/entity/profile_entitty/profile_entity.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepos;
  final ProfileRepository profileRepos;
  final SignUpNavigator navigator;

  SignUpCubit({required this.authRepos, required this.navigator, required this.profileRepos})
    : super(SignUpState());

  Future<void> onPressSignUp({
    String? fullName,
    required String email,
    String? mobileNumber,
    String? dateOfBirth,
    required String password,
  }) async {
    final result = await authRepos.signUp(email, password);
    if (result) {
      emit(SignUpState(isLoading: true));
      navigator.showSuccess("Sign up success");
    } else {
      navigator.showError("Sign up failed");
      return;
    }

    final profile = ProfileEntity(
      fullName: fullName,
      email: email,
      phoneNumber: mobileNumber,
      dateOfBirth: dateOfBirth,
      createdAt: DateTime.now(),
      userId: authRepos.userId,
    );

    profileRepos.addProfile(profile: profile);
    await authRepos.signIn(email, password);
    navigator.goHome();
  }

  void onPressSignIn() {
    navigator.toSignIn();
  }
}
