import 'package:flutter/material.dart';

import '../utils/color_theme.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? inputType;
  final Function(String)? onChange;
  final int? maxLength;
  final bool? isObscure;
  final Widget? suffix;
  const MyTextFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.onChange,
      this.maxLength,
      this.isObscure = false,
      this.inputType,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      obscureText: isObscure!,
      keyboardType: inputType,
      onChanged: onChange,
      style: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 231, 231, 238),
          hintText: hintText,
          counterText: "",
          hintStyle: const TextStyle(
              fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w300),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.transparent, width: 0.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          suffixIcon: suffix),
      cursorColor: ColorTheme.kPrimaryColor,
      onSaved: (newValue) => controller.text = newValue!,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter $hintText';
        }
        //********* CHECK NUMBER *******/
        if (hintText == "Your Phone Number") {
          if (value.length != 10 || !validatePhone(value)) {
            return 'Please Enter valid Phone Number';
          }
        }

        //********* CHECK EMIAL *******/
        if (hintText == "Your Email I'd" && !validateEmail(value)) {
          return 'Please Enter valid Email';
        }
        return null;
      },
    );
  }
}

class SignUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? inputType;
  final Function(String)? onChange;
  final int? maxLength;
  final bool? isObscure;
  final Widget? suffix;
  final String fieldName;
  const SignUpTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.fieldName,
      this.onChange,
      this.maxLength,
      this.isObscure = false,
      this.inputType,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: maxLength,
          controller: controller,
          obscureText: isObscure!,
          keyboardType: inputType,
          onChanged: onChange,
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 231, 231, 238),
              hintText: hintText,
              counterText: "",
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              suffixIcon: suffix),
          cursorColor: ColorTheme.kPrimaryColor,
          onSaved: (newValue) => controller.text = newValue!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter $hintText';
            }
            if (hintText == "Your Username") {
              if (value.length != 8) {
                return 'Please Enter valid Username';
              }
            }

            //********* CHECK NUMBER *******/
            if (hintText == "Your Phone Number") {
              if (value.length != 10 || !validatePhone(value)) {
                return 'Please Enter valid Phone Number';
              }
            }

            //********* CHECK EMIAL *******/
            if (hintText == "Your Email I'd" && !validateEmail(value)) {
              return 'Please Enter valid Email';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class PersonalDetailsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? inputType;
  final Function(String)? onChange;
  final Function()? onTap;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffix;
  final String fieldName;
  final bool readOnly;
  const PersonalDetailsTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.fieldName,
      this.onChange,
      this.onTap,
      this.maxLength,
      this.maxLines,
      this.inputType,
      this.suffix,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          maxLength: maxLength,
          maxLines: maxLines,
          controller: controller,
          keyboardType: inputType,
          onChanged: onChange,
          readOnly: readOnly,
          onTap: onTap,
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 231, 231, 238),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              suffixIcon: suffix),
        ),
      ],
    );
  }
}

bool validatePhone(String phone) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  return regExp.hasMatch(phone);
}

bool validateEmail(String email) {
  RegExp emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

  return emailReg.hasMatch(email);
}
