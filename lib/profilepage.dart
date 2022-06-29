import 'package:flutter/material.dart';
import 'package:loginapp/model/cardmodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asserts/login2.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 136, 176),
            title: const Text('Profile'),
            centerTitle: true,
          ),
          body: Center(
            child: ListView.builder(
              itemCount: datalist.length,
              itemBuilder: (context, index) => Card(
                elevation: 100,
                shadowColor: Colors.black,
                color: Color.fromARGB(255, 249, 206, 221),
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 124, 168),
                        radius: 108,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(datalist[index].image),

                          // NetworkImage(
                          // "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w524-h640/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg"),
                          radius: 100,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        datalist[index].name,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 181, 30, 111),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                          'I am a Computer Science Student Studying in Chouksey Engineering College Bilaspur. I am Learing Android App Development in Flutter in Nable Invent Solutions. Thank You',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () => 'Null',
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 255, 128, 128))),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Icon(Icons.touch_app),
                                Text('Visit'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
