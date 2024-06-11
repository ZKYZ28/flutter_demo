import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;


  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<RegisterUser>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStatus.unknow));

        final isAuth = await authRepository.registerUser(event.email, event.password);

        emit(state.copyWith(status: AuthStatus.authentificated));

        //throw Exception();
      } on Exception catch (e) {
        emit(state.copyWith(status: AuthStatus.unknow));
      }
    });
  }
}
