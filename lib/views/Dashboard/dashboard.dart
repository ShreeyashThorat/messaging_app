import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messaging_app/utils/color_theme.dart';
import 'package:messaging_app/views/Calls/calls.dart';
import 'package:messaging_app/views/Chats/chats.dart';
import 'package:messaging_app/views/Dashboard/cubit/bottom_nav_cubit.dart';
import 'package:messaging_app/views/Friends/friends.dart';
import 'package:messaging_app/views/People/people.dart';
import 'package:messaging_app/views/Profile/profile.dart';

import 'cubit/nav_bar_items.dart';

class Dashbboard extends StatefulWidget {
  const Dashbboard({super.key});

  @override
  State<Dashbboard> createState() => _DashbboardState();
}

class _DashbboardState extends State<Dashbboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark,
      //navigation bar icons' color
    ));
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.people) {
            return const PeopleScreen();
          } else if (state.navbarItem == NavbarItem.friends) {
            return const FriendsScreen();
          } else if (state.navbarItem == NavbarItem.chats) {
            return const ChatsScreen();
          } else if (state.navbarItem == NavbarItem.calls) {
            return const CallsScreen();
          } else if (state.navbarItem == NavbarItem.profile) {
            return const ProfileScreen();
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme:
                IconThemeData(size: 20, color: ColorTheme.kPrimaryColor),
            unselectedIconTheme:
                IconThemeData(size: 18, color: Colors.grey.shade500),
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: state.index,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.userPlus,
                ),
                label: 'People',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.userGroup,
                ),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidMessage,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.phone,
                ),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<BottomNavCubit>(context)
                    .getNavBarItem(NavbarItem.people);
              } else if (index == 1) {
                BlocProvider.of<BottomNavCubit>(context)
                    .getNavBarItem(NavbarItem.friends);
              } else if (index == 2) {
                BlocProvider.of<BottomNavCubit>(context)
                    .getNavBarItem(NavbarItem.chats);
              } else if (index == 3) {
                BlocProvider.of<BottomNavCubit>(context)
                    .getNavBarItem(NavbarItem.calls);
              } else if (index == 4) {
                BlocProvider.of<BottomNavCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
              }
            },
          );
        },
      ),
    );
  }
}
