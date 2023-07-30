import 'package:flutter/material.dart';
import 'package:messaging_app/views/Friends/received_request.dart';
import 'package:messaging_app/views/Friends/request_send.dart';
import 'package:messaging_app/views/Friends/user_friends.dart';

import '../../utils/color_theme.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen>
    with SingleTickerProviderStateMixin {
  late TabController friendsTabController;

  @override
  void initState() {
    super.initState();
    friendsTabController =
        TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Friends",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {
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
        bottom: TabBar(
            controller: friendsTabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            labelColor: Colors.white,
            splashFactory: NoSplash.splashFactory,
            labelStyle:
                const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            unselectedLabelColor: Colors.grey.shade400,
            unselectedLabelStyle:
                const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            tabs: [
              const Tab(
                text: "Friends",
              ),
              const Tab(
                text: "Sent",
              ),
              Tab(
                child: Row(
                  children: [
                    const Text("Received"),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Text(
                        "2",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
      body: TabBarView(controller: friendsTabController, children: [
        SizedBox(
            width: size.width, height: size.height, child: const UserFriends()),
        SizedBox(
            width: size.width, height: size.height, child: const RequestSent()),
        SizedBox(
            width: size.width,
            height: size.height,
            child: const ReceivedRequest()),
      ]),
    );
  }
}
