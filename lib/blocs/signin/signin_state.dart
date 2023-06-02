part of 'signin_cubit.dart';

enum SignInStatus {
  initial,
  submitting,
  success,
  error,
}

class SignInState extends Equatable {
  final SignInStatus signInStatus;
  final CustomError error;
  SignInState({
    required this.signInStatus,
    required this.error,
  });

  factory SignInState.initial() {
    return SignInState(
      signInStatus: SignInStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [signInStatus, error];

  @override
  bool get stringify => true;

  SignInState copyWith({
    SignInStatus? signInStatus,
    CustomError? error,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      error: error ?? this.error,
    );
  }
}
