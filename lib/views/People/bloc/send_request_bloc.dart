import 'package:bloc/bloc.dart';
import 'package:messaging_app/core/api.dart';

part 'send_request_event.dart';
part 'send_request_state.dart';

class SendRequestBloc extends Bloc<SendRequestEvent, SendRequestState> {
  final Api api = Api();
  SendRequestBloc() : super(SendRequestInitial()) {
    on<SendRequestEvent>((event, emit) {});
  }
}
