import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserFriends extends StatefulWidget {
  const UserFriends({super.key});

  @override
  State<UserFriends> createState() => _UserFriendsState();
}

class _UserFriendsState extends State<UserFriends> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: friendsContent.length,
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
                              friendsContent[index].imgUrl))),
                ),
                title: Text(
                  friendsContent[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  friendsContent[index].bio,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          );
        });
  }
}

class FriendsContect {
  final String id;
  final String imgUrl;
  final String name;
  final String bio;
  FriendsContect(
      {required this.id,
      required this.imgUrl,
      required this.bio,
      required this.name});
}

List<FriendsContect> friendsContent = [
  FriendsContect(
      id: "123456",
      imgUrl:
          "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      bio:
          "In a world full of noise, listen to the whispers of your heart; it knows the way.",
      name: "SidPro"),
  FriendsContect(
      id: "234567",
      imgUrl:
          "https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      bio: "let's be respectful to each other and crack jokes together",
      name: "Vaishali Thorat"),
  FriendsContect(
      id: "345678",
      imgUrl: "https://cdn-icons-png.flaticon.com/128/847/847969.png",
      bio:
          "Let your actions be guided by kindness, for it has the power to heal hearts and mend souls.",
      name: "Ashish")
];
