import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/navbarpages/homepage.dart';
import 'package:loginapp/navbarpages/locationpage.dart';
import 'package:loginapp/navbarpages/searchpage.dart';
import 'package:loginapp/profilepage.dart';
import 'package:loginapp/settingspage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';
  int index = 0;
  final screens = [
    // Center(
    //   child: Text(
    //     'Mail',
    //     style: TextStyle(fontSize: 70),
    //   ),
    // ),
    // Center(
    //   child: Text(
    //     'Chat',
    //     style: TextStyle(fontSize: 70),
    //   ),
    // ),
    // Center(
    //   child: Text(
    //     'Spaces',
    //     style: TextStyle(fontSize: 70),
    //   ),
    // ),
    // Center(
    //   child: Text(
    //     'Meet',
    //     style: TextStyle(fontSize: 70),
    //   ),
    // )
    HomePageNavBar(),
    SearchPage(),
    LocationPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asserts/login2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Color.fromARGB(255, 255, 224, 234),
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              height: 60,
              backgroundColor: Color.fromARGB(255, 255, 157, 190),
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.search_outlined), label: 'Search'),
                NavigationDestination(
                    icon: Icon(Icons.location_off), label: 'Location'),
                NavigationDestination(
                    icon: Icon(Icons.people_outline), label: 'Profile')
              ]),
        ),
        appBar: AppBar(
          // actions: [
          //   // IconButton(
          //   //   onPressed: () {
          //   //     Navigator.pop(context,
          //   //         MaterialPageRoute(builder: (context) => const MyLogin()));
          //   //   },
          //   //   icon: const Icon(Icons.logout),
          //   // )
          // ],
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 136, 176),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: const EdgeInsets.fromLTRB(60, 60, 60, 60),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 157, 190)),
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  '$_username',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),

                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const HomePage()));
                // }
              ),
              ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  }),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  }),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyLogin()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username') as String;
    // ignore: avoid_print
    print(_username);
    setState(() {});
  }
}
