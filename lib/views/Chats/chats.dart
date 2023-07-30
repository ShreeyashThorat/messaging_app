import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/views/Chats/Messages%20screen/messages_screen.dart';

import '../../utils/color_theme.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Chats",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) async {
              debugPrint(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
                const PopupMenuItem(
                  value: "Logout",
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Logout"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.logout,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: ListView.builder(
            itemCount: chatsContent.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  chatsContent[index].imgUrl))),
                    ),
                    title: Text(
                      chatsContent[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      chatsContent[index].msg,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    trailing: Text(
                      chatsContent[index].msgTime,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MessagesScreen(data: chatsContent[index])));
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class ChatsContent {
  final String id;
  final String imgUrl;
  final String name;
  final String msg;
  final String msgTime;
  ChatsContent(
      {required this.id,
      required this.imgUrl,
      required this.msg,
      required this.msgTime,
      required this.name});
}

List<ChatsContent> chatsContent = [
  ChatsContent(
      id: "123456",
      imgUrl:
          "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      msg: "Hello buddy..!",
      msgTime: "04:34",
      name: "SidPro"),
  ChatsContent(
      id: "234567",
      imgUrl:
          "https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      msg: "How are You?",
      msgTime: "04:00",
      name: "Vaishali Thorat"),
  ChatsContent(
      id: "345678",
      imgUrl: "https://cdn-icons-png.flaticon.com/128/847/847969.png",
      msg: "Kal Chale kya bahar?",
      msgTime: "02.02",
      name: "Ashish")
];
