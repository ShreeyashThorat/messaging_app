import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/utils/color_theme.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  List<String> imgs = [
    "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    "https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    "https://img.freepik.com/free-photo/smiling-happy-indian-goes-work-office-him-modern-building_496169-2880.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    "https://img.freepik.com/premium-photo/friends-all-grouped-together-shot-group-cheerful-friends-standing-together-portrait-while-looking-camera_590464-16037.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph",
    "https://img.freepik.com/premium-vector/confident-cool-business-woman-feeling-satisfied-glad-stand-with-folded-arms-standing-with-angel-wings-high-self-esteem-with-proud-smile-concept-illustration_270158-414.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 20,
              color: ColorTheme.kPrimaryColor,
            )),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            iconSize: 20,
            onSelected: (value) {
              debugPrint(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: size.height * 0.30,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(75, 15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.elliptical(75, 15)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        "https://img.freepik.com/free-photo/asian-boy-malaysian-culture-innocent-concept_53876-31633.jpg?size=626&ext=jpg&ga=GA1.2.106044016.1687106274&semt=sph"))),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sidpro",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      "Middle 20s, Male",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                    Text(
                      "Maharashtra, India",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(
                    width: size.width * 0.4,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorTheme.kPrimaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Send Request",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            height: 2,
            color: Colors.grey.shade300,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Introduction",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let your actions be guided by kindness, for it has the power to heal hearts and mend souls. Let your actions be guided by kindness, for it has the power to heal hearts and mend souls. Let your actions be guided by kindness, for it has the power to heal hearts and mend souls.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Photo Album",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            shrinkWrap: true,
            children: List.generate(
              imgs.length,
              (index) => CachedNetworkImage(
                key: UniqueKey(),
                fit: BoxFit.cover,
                width: size.width * 0.33,
                height: size.width * 0.33,
                fadeInDuration: const Duration(milliseconds: 200),
                fadeInCurve: Curves.easeInOut,
                imageUrl: imgs[index],
                placeholder: (context, url) => Container(
                  color: const Color(0xfff8f8ff),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          )
        ],
      ),
    );
  }
}
