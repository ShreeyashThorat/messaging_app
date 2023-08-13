import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:messaging_app/data/models/user_model.dart';
import 'package:messaging_app/database/user_database.dart';

import '../../../../data/repos/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepo = AuthRepo();
  LoginBloc() : super(LoginInitial()) {
    on<Login>(login);
  }

  Future<void> login(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      UserModel user =
          await authRepo.login(event.number, event.password, event.deviceToken);
      await UserDB.saveUserData(user);
      emit(LoginSuccess(user: user));
    } catch (e) {
      log(e.toString());
      emit(LoginError(errorMsg: e.toString()));
    }
  }
}
