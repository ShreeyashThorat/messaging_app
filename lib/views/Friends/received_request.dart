import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ReceivedRequest extends StatefulWidget {
  const ReceivedRequest({super.key});

  @override
  State<ReceivedRequest> createState() => _ReceivedRequestState();
}

class _ReceivedRequestState extends State<ReceivedRequest> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: receivedRequestContent.length,
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
                              receivedRequestContent[index].imgUrl))),
                ),
                title: Text(
                  receivedRequestContent[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  receivedRequestContent[index].msg,
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
          );
        });
  }
}

class ReceivedRequestContent {
  final String id;
  final String imgUrl;
  final String name;
  final String msg;
  ReceivedRequestContent(
      {required this.id,
      required this.imgUrl,
      required this.msg,
      required this.name});
}

List<ReceivedRequestContent> receivedRequestContent = [
  ReceivedRequestContent(
      id: "123456",
      imgUrl:
          "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      msg: "Hello buddy..!",
      name: "SidPro"),
  ReceivedRequestContent(
      id: "234567",
      imgUrl:
          "https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      msg: "Will you be my friend",
      name: "Vaishali Thorat"),
];
