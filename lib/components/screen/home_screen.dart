import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/login_page.dart';
import '../navigationview/category_view.dart';
import '../navigationview/explore_view.dart';
import '../navigationview/home_view.dart';
import '../navigationview/profile_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
  final tabs = [const HomeView(), const ExploreView(), const CategoryView(), const ProfileView()];

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: tabs[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !keyboardIsOpen,
        child: SizedBox(
          width: 64,
          height: 64,
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: const Color(0xff26D38D),
            elevation: 6,
            child: const SizedBox(
              height: 32,
              width: 32,
              child: ImageIcon(
                AssetImage("assets/icons/shopping_bucket.png"),
              ),
            ),
          ),
        ), // your FloatingActionButton
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xff26D38D),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 30,
                width: 30,
                child: ImageIcon(
                  AssetImage("assets/icons/ic_home_3x.png"),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 28,
                width: 28,
                child: ImageIcon(
                  AssetImage("assets/icons/discover.png"),
                ),
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: ImageIcon(
                  AssetImage("assets/icons/category.png"),
                ),
              ),
              label: 'Alerts',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 28,
                width: 28,
                child: ImageIcon(
                  AssetImage("assets/icons/profile.png"),
                ),
              ),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            switch (index) {
              case 0:
                break;
              case 1:
                break;
            }
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Are you sure to logout ?'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              logOut();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
