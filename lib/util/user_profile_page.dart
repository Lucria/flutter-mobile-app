import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/data/app_data.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  CelloUser _currentUser =
      CelloUser(18, "loading@gmail.com", "loading", "loading", 0, 0, 'Female');

  Future<List<CelloUser>> getAllUsers() async {
    return (await FirebaseFirestore.instance.collection("/users").get())
        .docs
        .map((item) => CelloUser.fromMap(item.data()))
        .toList();
  }

  Future<CelloUser> getUserByEmail(String email) async {
    return (await FirebaseFirestore.instance
            .collection("/users")
            .where("email", isEqualTo: email)
            .get())
        .docs
        .map((item) => CelloUser.fromMap(item.data()))
        .toList()
        .first;
  }

  @override
  void initState() {
    getUserByEmail(FirebaseAuth.instance.currentUser!.email!)
        .then((value) => _currentUser = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserByEmail(FirebaseAuth.instance.currentUser!.email!),
        initialData: _currentUser,
        builder: (BuildContext context, AsyncSnapshot<CelloUser> object) {
          _currentUser = object.data!;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserAvatar(
                    avatarColor: Colors.lightBlueAccent,
                    email: _currentUser.email!,
                  ),
                  Card(
                    elevation: 4,
                    semanticContainer: true,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person_pin,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              "${_currentUser.firstName} ${_currentUser.lastName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ]),
                  ),
                  Card(
                    elevation: 4,
                    semanticContainer: true,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.transgender,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              _currentUser.gender!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ]),
                  ),
                  Card(
                    elevation: 4,
                    semanticContainer: true,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.accessibility,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              _currentUser.height!.toString() + "cm",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ]),
                  ),
                  Card(
                    elevation: 4,
                    semanticContainer: true,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.scale,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              _currentUser.weight!.toString() + "kg",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ]),
                  ),
                  Card(
                    elevation: 4,
                    semanticContainer: true,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.calendar_month,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              _currentUser.age!.toString() + " Years Old",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class UserAvatar extends StatelessWidget {
  final Color avatarColor;
  final String email;
  final void Function()? onAvatarTap;
  const UserAvatar({
    Key? key,
    required this.avatarColor,
    required this.email,
    this.onAvatarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: onAvatarTap,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 65,
              child: const Icon(
                Icons.person,
                size: 65,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
