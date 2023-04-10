import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.blue
        ),
      ),
      body: const Center(
        child: Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('usar@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/friendship.png'),
              ),
            ),
            ListTile(
              title: Text('My Profile'),
              leading: Icon(CupertinoIcons.person),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Themes'),
              leading: Icon(CupertinoIcons.color_filter),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Fonts'),
              leading: Icon(Icons.font_download_outlined),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(CupertinoIcons.heart),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(CupertinoIcons.settings),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
