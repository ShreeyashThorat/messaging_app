import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RequestSent extends StatefulWidget {
  const RequestSent({super.key});

  @override
  State<RequestSent> createState() => _RequestSentState();
}

class _RequestSentState extends State<RequestSent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: requestSentContent.length,
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
                              requestSentContent[index].imgUrl))),
                ),
                title: Text(
                  requestSentContent[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  requestSentContent[index].status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13,
                      color: requestSentContent[index].status != "Rejected"
                          ? Colors.black
                          : Colors.red),
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

class RequestSentContent {
  final String id;
  final String imgUrl;
  final String name;
  final String status;
  RequestSentContent(
      {required this.id,
      required this.imgUrl,
      required this.status,
      required this.name});
}

List<RequestSentContent> requestSentContent = [
  RequestSentContent(
      id: "123456",
      imgUrl:
          "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      status: "Pending",
      name: "Shreeyash"),
  RequestSentContent(
      id: "234567",
      imgUrl:
          "https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
      status: "Rejected",
      name: "Aishwarya Thorat"),
  RequestSentContent(
      id: "345678",
      imgUrl: "https://cdn-icons-png.flaticon.com/128/847/847969.png",
      status: "Rejected",
      name: "Deepika")
];
