import 'package:flutter/material.dart';

class HomePageNavBar extends StatefulWidget {
  const HomePageNavBar({Key? key}) : super(key: key);

  @override
  State<HomePageNavBar> createState() => _HomePageNavBarState();
}

class _HomePageNavBarState extends State<HomePageNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asserts/login2.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        label: Text('Bottom Sheet'),
      )),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.share_outlined),
                title: Text('Share'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text('Get link'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Video Name'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Video'),
                onTap: () => {},
              )
            ],
          ),
        );
      });
}
