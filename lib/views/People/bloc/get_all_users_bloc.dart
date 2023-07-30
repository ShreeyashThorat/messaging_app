import 'package:bloc/bloc.dart';
import 'package:messaging_app/data/models/user_model.dart';
import 'package:messaging_app/data/repos/get_users_repo.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc() : super(GetAllUsersInitial()) {
    on<GetAllUser>(initial);
  }
  final getUsersRepo = GetUsersRepo();
  void initial(GetAllUser event, Emitter<GetAllUsersState> emit) async {
    emit(GetAllUserLoading(state.allUsers));
    try {
      final allUsers = await getUsersRepo.getAllUsers(event.userId);
      emit(GetAllUserSuccessfully(allUsers));
    } catch (ex) {
      emit(GetAllUserError(ex.toString(), state.allUsers));
    }
  }
}
