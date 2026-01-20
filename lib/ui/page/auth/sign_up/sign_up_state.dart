import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  const SignUpState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}
