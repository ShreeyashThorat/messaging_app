import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:messaging_app/views/Authentication/Sign%20Up/bloc/create_user_bloc.dart';
import 'package:messaging_app/widgets/textformfields.dart';

import '../../../utils/color_theme.dart';
import '../../../utils/constants.dart';
import '../../Dashboard/dashboard.dart';

class AddPersonalDetails extends StatefulWidget {
  final String name;
  final String email;
  final String number;
  final String password;
  const AddPersonalDetails(
      {Key? key,
      required this.name,
      required this.email,
      required this.number,
      required this.password})
      : super(key: key);

  @override
  State<AddPersonalDetails> createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  final CreateUserBloc createUserBloc = CreateUserBloc();
  File? userProfile;
  bool checkBox = false;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken = "";

  @override
  void initState() {
    contryController.text = "India";
    stateController.text = "Deselect";
    getToken();
    super.initState();
  }

  void getToken() async {
    await firebaseMessaging.getToken().then((token) {
      setState(() {
        deviceToken = token;
        debugPrint("my token is $deviceToken");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      width: size.width * 0.35,
                      height: size.width * 0.35,
                      decoration: userProfile != null
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(userProfile!)))
                          : const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(Constants.user))),
                    ),
                    Positioned(
                        right: 5,
                        bottom: 5,
                        child: InkWell(
                          onTap: () => getImage(ImageSource.gallery),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorTheme.kPrimaryColor),
                            child: const FaIcon(
                              FontAwesomeIcons.camera,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 35),
              PersonalDetailsTextField(
                controller: genderController,
                hintText: "Gender",
                fieldName: "Gender :",
                readOnly: true,
                onTap: () {
                  genderBottomSheet(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PersonalDetailsTextField(
                controller: dobController,
                hintText: "Choose Date of Birth",
                fieldName: "Date Of Birth :",
                readOnly: true,
                suffix: Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.calendar,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDatePickerMode: DatePickerMode.year,
                      helpText: "Select Date of Birth");
                  setState(() {
                    dobController.text =
                        DateFormat('MMM d, y').format(selectedDate!);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PersonalDetailsTextField(
                controller: contryController,
                hintText: "Nationality",
                fieldName: "Nationality :",
                readOnly: true,
              ),
              const SizedBox(
                height: 10,
              ),
              PersonalDetailsTextField(
                controller: stateController,
                hintText: "State",
                fieldName: "State :",
                readOnly: true,
                onTap: () {
                  stateBottomModelSheet();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PersonalDetailsTextField(
                controller: infoController,
                hintText: "Self Introduction",
                fieldName: "Self Introduction :",
                maxLength: 140,
                maxLines: 6,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkBox = !checkBox;
                      });
                    },
                    child: checkBox != true
                        ? FaIcon(
                            FontAwesomeIcons.square,
                            color: Colors.grey.shade400,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.squareCheck,
                            color: Colors.deepPurple,
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      "Note: Before click on register button please make sure that you have selected correct answer for gender and date of birth. Because you can't change your answer after registration.",
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          )),
          BlocConsumer<CreateUserBloc, CreateUserState>(
            bloc: createUserBloc,
            listener: (context, state) {
              if (state is ProfilePicUploadSuccessfully) {
                createUserBloc.add(CreateUser(
                    name: widget.name,
                    email: widget.email,
                    phone: widget.number,
                    password: widget.password,
                    gender: genderController.text,
                    dob: dobController.text,
                    imgUrl: state.imgUrl,
                    introduction: infoController.text,
                    nationality: contryController.text,
                    states: stateController.text,
                    deviceToken: deviceToken!));
              }
              if (state is CreateUserError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMsg)));
              }
              if (state is CreateUserSuccessfully) {
                debugPrint(state.user.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashbboard()));
              }
            },
            builder: (context, state) {
              return Container(
                width: size.width,
                height: 50,
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorTheme.kButtonColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)))),
                    onPressed: () async {
                      if (checkBox == false) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Please make sure you have read the note, and marked it as read")));
                      } else {
                        register();
                      }
                    },
                    child: state is CreateUserLoading
                        ? const SpinKitThreeBounce(
                            color: Colors.white,
                            size: 25,
                            duration: Duration(seconds: 2),
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
              );
            },
          )
        ],
      ),
    );
  }

  void register() {
    String name = widget.name;
    String email = widget.email;
    String number = widget.number;
    String password = widget.password;
    String gender = genderController.text;
    String dob = dobController.text;
    String nationality = contryController.text;
    String state = stateController.text;
    String introduction = infoController.text;
    if (gender.isEmpty || dob.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Gender and date of birth fields can't be empty!")));
    } else {
      if (userProfile != null) {
        createUserBloc.add(UploadImage(
            profilePic: userProfile!,
            path: "userProfiles/$number/${DateTime.now().toLocal()}.png"));
      } else {
        createUserBloc.add(CreateUser(
            name: name,
            email: email,
            phone: number,
            password: password,
            gender: gender,
            dob: dob,
            imgUrl: "https://cdn-icons-png.flaticon.com/128/847/847969.png",
            introduction: introduction,
            nationality: nationality,
            states: state,
            deviceToken: deviceToken!));
      }
    }
  }

  void genderBottomSheet(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    Constants.gender.length,
                    (index) => ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              genderController.text = Constants.gender[index];
                            });
                          },
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text(Constants.gender[index]),
                        ))
              ],
            ),
          );
        });
  }

  void stateBottomModelSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        builder: (context) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: Constants.states.length,
                      itemBuilder: (context, index) => ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                stateController.text = Constants.states[index];
                              });
                            },
                            title: Text(Constants.states[index]),
                          )))
            ],
          );
        });
  }

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        userProfile = File(pickedImage.path);
      });
    }
  }
}
