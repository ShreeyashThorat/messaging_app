part of 'get_all_users_bloc.dart';

abstract class GetAllUsersState {
  final List<UserModel> allUsers;
  const GetAllUsersState(this.allUsers);
}

class GetAllUsersInitial extends GetAllUsersState {
  GetAllUsersInitial() : super([]);
}

class GetAllUserLoading extends GetAllUsersState {
  GetAllUserLoading(super.allUsers);
}

class GetAllUserSuccessfully extends GetAllUsersState {
  GetAllUserSuccessfully(super.allUsers);
}

class GetAllUserError extends GetAllUsersState {
  final String errMsg;
  GetAllUserError(this.errMsg, super.allUsers);
}
