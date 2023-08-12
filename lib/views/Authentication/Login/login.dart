import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messaging_app/views/Authentication/Login/bloc/login_bloc.dart';
import 'package:messaging_app/views/Dashboard/dashboard.dart';

import '../../../utils/color_theme.dart';
import '../../../widgets/textformfields.dart';
import '../Sign Up/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginForm = GlobalKey<FormState>();
  bool isObscure = true;
  final LoginBloc loginBloc = LoginBloc();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken = "";

  @override
  void initState() {
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
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => exit(0),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              Text(
                "Hey\nLogin Now!",
                style: GoogleFonts.notoSerif(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account?  ",
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                    TextSpan(
                        text: "Create New",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp())))
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Form(
                  key: loginForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFormField(
                          maxLength: 10,
                          inputType: TextInputType.number,
                          controller: mobileController,
                          hintText: "Your Phone Number"),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        controller: passwordController,
                        hintText: "Your Password",
                        isObscure: isObscure,
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15,
                            color: ColorTheme.kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Oops, I forgot my password!",
                    style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Reset",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          )),
          BlocConsumer<LoginBloc, LoginState>(
            bloc: loginBloc,
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashbboard()));
              }
              if (state is LoginError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMsg)));
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
                    onPressed: () {
                      if (loginForm.currentState!.validate()) {
                        loginBloc.add(Login(
                            number: mobileController.text,
                            password: passwordController.text,
                            deviceToken: deviceToken!));
                      }
                    },
                    child: state is LoginLoading
                        ? const SpinKitThreeBounce(
                            color: Colors.white,
                            size: 25,
                            duration: Duration(seconds: 2),
                          )
                        : const Text(
                            "Login Now",
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
}
