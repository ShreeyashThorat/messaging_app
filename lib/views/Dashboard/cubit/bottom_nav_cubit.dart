import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:messaging_app/views/Dashboard/cubit/nav_bar_items.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState(NavbarItem.chats, 2));
  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.people:
        emit(const BottomNavState(NavbarItem.people, 0));
        break;
      case NavbarItem.friends:
        emit(const BottomNavState(NavbarItem.friends, 1));
        break;
      case NavbarItem.chats:
        emit(const BottomNavState(NavbarItem.chats, 2));
        break;
      case NavbarItem.calls:
        emit(const BottomNavState(NavbarItem.calls, 3));
        break;
      case NavbarItem.profile:
        emit(const BottomNavState(NavbarItem.profile, 4));
        break;
    }
  }
}
