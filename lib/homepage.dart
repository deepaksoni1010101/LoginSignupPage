import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';
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

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asserts/login2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => const MyLogin()));
              },
              icon: const Icon(Icons.logout),
            )
          ],
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
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 157, 190)),
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
