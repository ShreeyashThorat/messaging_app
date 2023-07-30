import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messaging_app/services/formatter.dart';
import 'package:messaging_app/utils/color_theme.dart';
import 'package:messaging_app/views/Chats/chats.dart';

class MessagesScreen extends StatefulWidget {
  final ChatsContent data;
  const MessagesScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<MessageContent> messages = messageContent.reversed.toList();
  TextEditingController msgController = TextEditingController();
  bool showSendBtn = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = widget.data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.kPrimaryColor,
        elevation: 0,
        leadingWidth: 28,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 23,
              color: Colors.white,
            )),
        title: Row(
          children: [
            Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(data.imgUrl))),
            ),
            const SizedBox(width: 10),
            Text(
              data.name,
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.videocam,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.call, color: Colors.white),
              onPressed: () {}),
          PopupMenuButton<String>(
            padding: const EdgeInsets.all(0),
            color: Colors.white,
            onSelected: (value) {
              debugPrint(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "View Profile",
                  child: Text("View Profile"),
                ),
                const PopupMenuItem(
                  value: "Search",
                  child: Text("Search"),
                ),
                const PopupMenuItem(
                  value: "Clear chat",
                  child: Text("Clear chat"),
                ),
              ];
            },
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      // margin: const EdgeInsets.symmetric(
                      //     horizontal: 8, vertical: 5),
                      child: Row(
                        mainAxisAlignment: message.id != "987456"
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          message.id != "987456"
                              ? const SizedBox()
                              : Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Text(
                                    "Read",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black45),
                                  ),
                                ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: size.width * 2 / 3),
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(
                                    8,
                                  ),
                                  topRight: const Radius.circular(8),
                                  bottomRight: Radius.circular(
                                      message.id != "987456" ? 8 : 0),
                                  topLeft: Radius.circular(
                                      message.id != "987456" ? 0 : 8),
                                ),
                              ),
                              color: message.id != "987456"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 201, 201, 225),
                              child: Stack(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 20,
                                      ),
                                      child: Text(message.msg)),
                                  Positioned(
                                    bottom: 4,
                                    right: 10,
                                    child: Text(
                                      Formatter.formatDate(
                                          message.msgTime.toString()),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: msgController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type a message",
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  suffixIcon: showSendBtn
                      ? TextButton(
                          onPressed: () {
                            final MessageContent sendMsg = MessageContent(
                                id: "987456",
                                msg: msgController.text,
                                msgTime: DateTime.now(),
                                read: true);
                            setState(() {
                              messageContent.add(sendMsg);
                              msgController.clear();
                            });
                          },
                          child: Text(
                            "Send",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorTheme.kPrimaryColor),
                          ))
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  size: 20,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.camera,
                                  size: 20,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.microphone,
                                  size: 20,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                  contentPadding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      showSendBtn = true;
                    });
                  } else {
                    setState(() {
                      showSendBtn = false;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageContent {
  final String id;
  final String msg;
  final DateTime msgTime;
  final bool read;
  MessageContent(
      {required this.id,
      required this.msg,
      required this.msgTime,
      required this.read});
}

List<MessageContent> messageContent = [
  MessageContent(
      id: "234567",
      msg: 'Hey, How are you?',
      msgTime: DateTime.now().subtract(const Duration(seconds: 10)),
      read: true),
  MessageContent(
      id: "987456",
      msg: 'Hey, I am Fine \nHow are you?',
      msgTime: DateTime.now().subtract(const Duration(minutes: 10)),
      read: true),
  MessageContent(
      id: "234567",
      msg: 'I am also fine',
      msgTime: DateTime.now().subtract(const Duration(seconds: 50)),
      read: true),
  MessageContent(
      id: "987456",
      msg: 'Great! have you seen oppenheimer?',
      msgTime: DateTime.now().subtract(const Duration(seconds: 30)),
      read: true),
  MessageContent(
      id: "234567",
      msg: 'nope...have you?',
      msgTime: DateTime.now().subtract(const Duration(seconds: 25)),
      read: true),
  MessageContent(
      id: "987456",
      msg:
          'Nahhh....some of my friends told me that its a very boring movie and all...so i canceled my plan',
      msgTime: DateTime.now().subtract(const Duration(seconds: 20)),
      read: true),
  MessageContent(
      id: "234567",
      msg: 'Ohhh...yeah my friends also told me the same....',
      msgTime: DateTime.now().subtract(const Duration(seconds: 15)),
      read: true),
  MessageContent(
      id: "234567",
      msg: 'By the way, your coming with us on monday... right??',
      msgTime: DateTime.now().subtract(const Duration(seconds: 10)),
      read: true),
  MessageContent(
      id: "987456",
      msg: 'I am not sure yrr...but yeah i will try my best',
      msgTime: DateTime.now(),
      read: true),
];
