import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messaging_app/views/People/bloc/get_all_users_bloc.dart';

import '../../utils/color_theme.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final GetAllUsersBloc getAllUsersBloc = GetAllUsersBloc();
  final String userId = "64c68e3067f70b15dd6365b2";

  @override
  void initState() {
    getAllUsersBloc.add(GetAllUser(userId: userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Peoples",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                getAllUsersBloc.add(GetAllUser(userId: userId));
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              )),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) async {
              debugPrint(value);
              // if (value == "Logout") {
              //   final userBox = await Hive.openBox('user_box');
              //   userBox.delete('user_data');
              //   debugPrint("done");
              // }
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
      body: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
        bloc: getAllUsersBloc,
        builder: (context, state) {
          if (state is GetAllUserLoading && state.allUsers.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorTheme.kPrimaryColor,
              ),
            );
          }
          if (state is GetAllUserError && state.allUsers.isEmpty) {
            return Center(
              child: Text(
                state.errMsg,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorTheme.kPrimaryColor),
              ),
            );
          }
          if (state is GetAllUserSuccessfully && state.allUsers.isEmpty) {
            return Center(
              child: Text(
                "There are No Users Available",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorTheme.kPrimaryColor),
              ),
            );
          }
          return ListView.builder(
              itemCount: state.allUsers.length,
              itemBuilder: (context, index) {
                final data = state.allUsers[index];
                return Stack(
                  children: [
                    Column(
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
                                        data.profilePic!))),
                          ),
                          title: Text(
                            data.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            data.intro!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}

class PeoplesContent {
  final String id;
  final String imgUrl;
  final String name;
  final String bio;
  PeoplesContent({
    required this.id,
    required this.imgUrl,
    required this.bio,
    required this.name,
  });
}

List<PeoplesContent> peoplesContent = [
  PeoplesContent(
    id: "123456",
    imgUrl:
        "https://img.freepik.com/premium-photo/woman-yellow-jacket-stands-front-building-with-sunset-background_25996-5250.jpg?size=626&ext=jpg&ga=GA1.1.106044016.1687106274&semt=sph",
    bio:
        "True strength is not measured by muscle, but by the resilience of the human spirit in the face of adversity.",
    name: "Tejal",
  ),
  PeoplesContent(
    id: "123456",
    imgUrl:
        "https://img.freepik.com/premium-vector/cute-little-boy-standing-with-arms-crossed-pose_535862-995.jpg?size=626&ext=jpg&ga=GA1.1.106044016.1687106274&semt=sph",
    bio:
        "Life's journey is not about reaching the destination, but savoring the beauty of every step along the way.",
    name: "Hemang",
  ),
  PeoplesContent(
    id: "234567",
    imgUrl:
        "https://img.freepik.com/free-vector/one-happy-boy-with-green-backpack_1308-69184.jpg?size=626&ext=jpg&ga=GA1.1.106044016.1687106274&semt=sph",
    bio:
        "Let your actions be guided by kindness, for it has the power to heal hearts and mend souls.",
    name: "Diveysh",
  ),
  PeoplesContent(
    id: "345678",
    imgUrl:
        "https://img.freepik.com/premium-vector/portrait-beautiful-girl-vector-cartoon-illustration_1196-945.jpg?size=626&ext=jpg&ga=GA1.1.106044016.1687106274&semt=sph",
    bio:
        "Like the moon embraces the night, find solace in accepting both the darkness and light within yourself.",
    name: "Arpana",
  ),
  PeoplesContent(
    id: "123456",
    imgUrl:
        "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    bio:
        "https://img.freepik.com/free-vector/cute-boy-standing-position-showing-thumb_96037-450.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    name: "Atharva Sankhe",
  ),
  PeoplesContent(
    id: "234567",
    imgUrl:
        "https://img.freepik.com/free-vector/happy-teen-cartoon-sitting-floor_1308-133774.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    bio:
        "In the tapestry of time, every moment weaves a story that becomes the legacy of our existence.",
    name: "Satyam",
  ),
  PeoplesContent(
    id: "345678",
    imgUrl:
        "https://img.freepik.com/free-photo/portrait-smiling-beautiful-brunette-woman-cute-dress-red-lips-flowers-background-concept-professional-photossesion-modern-greenhouse_7502-8441.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    bio:
        "Cherish the people who color your life with love, for they are the true masterpieces in your gallery of memories.",
    name: "Krisha",
  )
];
