part of 'create_user_bloc.dart';

abstract class CreateUserEvent {
  const CreateUserEvent();
}

class UploadImage extends CreateUserEvent {
  final File profilePic;
  final String path;
  UploadImage({required this.profilePic, required this.path});
}

class CreateUser extends CreateUserEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String gender;
  final String dob;
  final String imgUrl;
  final String nationality;
  final String states;
  final String introduction;
  final String deviceToken;
  CreateUser(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.gender,
      required this.dob,
      required this.imgUrl,
      required this.introduction,
      required this.nationality,
      required this.states,
      required this.deviceToken});
}
