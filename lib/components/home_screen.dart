import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup/components/login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  Widget _listViewBody() {
    return ListView.separated(
        controller: _homeController,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              'Item $index',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              thickness: 1,
            ),
        itemCount: 50);
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (context) => LoginPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blue),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const Center(child: Text("Home Page")),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Open Dialog',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              showModal(context);
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
             UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('${FirebaseAuth.instance.currentUser?.email.toString()}'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/friendship.png'),
              ),
            ),
            ListTile(
              title: Text('My Profile'),
              leading: Icon(CupertinoIcons.person),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Themes'),
              leading: Icon(CupertinoIcons.color_filter),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Fonts'),
              leading: Icon(Icons.font_download_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(CupertinoIcons.heart),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(CupertinoIcons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
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
}
