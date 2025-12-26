import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final bool isLoading;
  const SignInState({this.isLoading = false});


  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
}