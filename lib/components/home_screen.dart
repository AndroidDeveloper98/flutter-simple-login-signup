import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:login_signup/components/view/category_view.dart';
import 'package:login_signup/components/view/explore_view.dart';
import 'package:login_signup/components/view/home_view.dart';
import 'package:login_signup/components/view/profile_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
  final tabs = [HomeView(), ExploreView(), CategoryView(),ProfileView()];

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFDFDFD),
      /*appBar: AppBar(
        title: const Text('Dashboard'),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.blue),
        actions: [
          IconButton(
            onPressed: () {
              logoutDialog(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),*/
      body: tabs[_selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor:Color(0xff26D38D),
          child: const SizedBox(
            height: 32,
            width: 32,
            child: ImageIcon(
              AssetImage("assets/icons/shopping_bucket.png"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xff26D38D),
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
