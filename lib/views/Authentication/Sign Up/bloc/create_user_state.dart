part of 'create_user_bloc.dart';

abstract class CreateUserState {
  const CreateUserState();
}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class ProfilePicUploadSuccessfully extends CreateUserState {
  final String imgUrl;
  ProfilePicUploadSuccessfully({required this.imgUrl});
}

class CreateUserSuccessfully extends CreateUserState {
  final UserModel user;
  CreateUserSuccessfully({required this.user});
}

class CreateUserError extends CreateUserState {
  final String errorMsg;
  CreateUserError({required this.errorMsg});
}
