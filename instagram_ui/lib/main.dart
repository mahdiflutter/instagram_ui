import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/bloc/home/home_bloc.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/screens/addpost_screen.dart';
import 'package:instagram_ui/screens/explore_screen.dart';
import 'package:instagram_ui/screens/home_screen.dart';
import 'package:instagram_ui/screens/login_screen.dart';
import 'package:instagram_ui/screens/notifications_screen.dart';
import 'package:instagram_ui/screens/profile_screen.dart';

void main() async {
  await initioalGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          children: getScreens(),
          index: selectedScreen,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedScreen,
          onTap: (value) {
            setState(() {
              selectedScreen = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png'),
              label: '',
              activeIcon: Image.asset('assets/icons/homeactive.png'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/search.png'),
              label: '',
              activeIcon: Image.asset('assets/icons/searchactive.png'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/addpost.png'),
              label: '',
              activeIcon: Image.asset('assets/icons/addpost.png'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/like.png'),
              label: '',
              activeIcon: Image.asset('assets/icons/likeactive.png'),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  'assets/images/profile.png',
                ),
              ),
              label: '',
              activeIcon: Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    'assets/images/profile.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
      const ExploreScreen(),
      const AddPostScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
  }
}
