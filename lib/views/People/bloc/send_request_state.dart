part of 'send_request_bloc.dart';

class SendRequestState {}

class SendRequestInitial extends SendRequestState {}

class RequestSendingState extends SendRequestState {}

class RequestSentSuccessfully extends SendRequestState {}

class RequestErrorState extends SendRequestState {
  final String errMsg;
  RequestErrorState({required this.errMsg});
}
