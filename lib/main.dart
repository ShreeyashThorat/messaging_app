import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:messaging_app/utils/color_theme.dart';
import 'package:messaging_app/views/Authentication/Sign%20Up/bloc/create_user_bloc.dart';
import 'package:messaging_app/views/People/bloc/get_all_users_bloc.dart';

import 'firebase_options.dart';
import 'views/Authentication/Login/login.dart';
import 'views/Dashboard/cubit/bottom_nav_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => CreateUserBloc()),
        BlocProvider(create: (context) => GetAllUsersBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashSCreen(),
      ),
    );
  }
}

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Messaging App",
          style: TextStyle(fontSize: 20, color: ColorTheme.kPrimaryColor),
        ),
      ),
    );
  }

  void checkUser() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false);
  }

  // void checkUser() async {
  //   final userBox = await Hive.openBox('user_box');
  //   final userData = userBox.get('user_data');

  //   if (userData != null) {
  //     final user = UserModel.fromJson(Map<String, dynamic>.from(userData));
  //     print(user.name);
  //     await Future.delayed(const Duration(seconds: 1)).then((value) {
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => const Dashbboard()),
  //           (Route<dynamic> route) => false);
  //     });
  //   } else {
  //     await Future.delayed(const Duration(seconds: 1)).then((value) {
  // Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //     (Route<dynamic> route) => false);
  //     });
  //   }
  // }
}
