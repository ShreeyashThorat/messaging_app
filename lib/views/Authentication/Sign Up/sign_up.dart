import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messaging_app/views/Authentication/Sign%20Up/add_personal_details.dart';

import '../../../utils/color_theme.dart';
import '../../../widgets/textformfields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final signForm = GlobalKey<FormState>();
  bool password = true;
  bool confirmPass = true;
  @override
  void initState() {
    super.initState();
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
              Text(
                "Let's\nGet Started!",
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
                      text: "Already have an account..!  ",
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                    TextSpan(
                        text: "Go back",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pop(context))
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Form(
                  key: signForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignUpTextField(
                        controller: nameController,
                        hintText: "Your Full Name",
                        fieldName: 'Full Name :',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignUpTextField(
                        controller: emailController,
                        hintText: "Your Email I'd",
                        fieldName: "Email I'd :",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignUpTextField(
                        controller: phoneController,
                        hintText: "Your Phone Number",
                        fieldName: 'Phone Number :',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignUpTextField(
                        controller: passwordController,
                        hintText: "Set Password",
                        isObscure: password,
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              password = !password;
                            });
                          },
                          child: Icon(
                            password
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15,
                            color: ColorTheme.kPrimaryColor,
                          ),
                        ),
                        fieldName: 'Password :',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignUpTextField(
                        controller: confirmPassController,
                        hintText: "Confirm Password",
                        isObscure: confirmPass,
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              confirmPass = !confirmPass;
                            });
                          },
                          child: Icon(
                            confirmPass
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15,
                            color: ColorTheme.kPrimaryColor,
                          ),
                        ),
                        fieldName: 'Confirm Password :',
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
          Container(
            width: size.width,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ColorTheme.kButtonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)))),
                onPressed: () async {
                  if (signForm.currentState!.validate()) {
                    if (passwordController.text != confirmPassController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Please make sure you have entered correct password")));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPersonalDetails(
                                  name: nameController.text,
                                  email: emailController.text.trim(),
                                  number: phoneController.text.trim(),
                                  password: passwordController.text.trim())));
                    }
                  }
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }
}
