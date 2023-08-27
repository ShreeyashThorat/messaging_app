part of 'send_request_bloc.dart';

class SendRequestEvent {
  final String senderId;
  final String receiverId;
  SendRequestEvent({required this.senderId, required this.receiverId});
}
