// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

import 'package:bloc_auth_app/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  late final StreamSubscription authSubscription;
  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((fbAuth.User? user) {
      add(AuthStateChangedEvent(user: user));
    });
    on<AuthStateChangedEvent>((event, emit) {
      if (event.user != null) {
        emit(state.copyWith(
          authStatus: AuthStatus.authenticated,
          user: event.user,
        ));
      } else {
        emit(state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          user: null,
        ));
      }
    });
    on<SignOutRequestedEvent>(
      (event, emit) async {
        await authRepository.signOut();
      },
    );
  }
}
