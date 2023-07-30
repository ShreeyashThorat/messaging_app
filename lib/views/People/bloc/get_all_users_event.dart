part of 'get_all_users_bloc.dart';

abstract class GetAllUsersEvent {
  const GetAllUsersEvent();
}

class GetAllUser extends GetAllUsersEvent {
  final String userId;
  GetAllUser({required this.userId});
}
