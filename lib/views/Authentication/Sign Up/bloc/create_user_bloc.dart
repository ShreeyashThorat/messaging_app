import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:messaging_app/data/repos/auth_repo.dart';

import '../../../../data/models/user_model.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final authRepo = AuthRepo();
  CreateUserBloc() : super(CreateUserInitial()) {
    on<UploadImage>(uploadImg);
    on<CreateUser>(createUser);
  }

  Future<void> uploadImg(
      UploadImage event, Emitter<CreateUserState> emit) async {
    emit(CreateUserLoading());
    try {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('userProfile/${event.path}/${DateTime.now().toLocal()}.png');
      final UploadTask uploadTask = storageRef.putFile(event.profilePic);
      final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));

      final String url = (await downloadUrl.ref.getDownloadURL());
      emit(ProfilePicUploadSuccessfully(imgUrl: url));
    } catch (e) {
      emit(CreateUserError(errorMsg: 'Failed to register...try again'));
    }
  }

  Future<void> createUser(
      CreateUser event, Emitter<CreateUserState> emit) async {
    emit(CreateUserLoading());
    try {
      UserModel user = await authRepo.createAccount(
          event.name,
          event.email,
          event.phone,
          event.password,
          event.gender,
          event.dob,
          event.imgUrl,
          event.nationality,
          event.states,
          event.introduction,
          event.deviceToken);
      emit(CreateUserSuccessfully(user: user));
    } catch (e) {
      emit(CreateUserError(errorMsg: 'Failed to register...try again'));
    }
  }
}
