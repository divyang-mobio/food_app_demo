import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color.fromARGB(255, 222, 61, 104),
            child: CircleAvatar(
              radius: 58,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.grey.shade500,
                child: const Icon(Icons.person_rounded, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Divyang Parmar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const Text("parmardivyang159@gmail.com"),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editProfile');
            },
            minWidth: MediaQuery.of(context).size.width * .5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: const Color.fromARGB(255, 222, 61, 104),
            child: const Text('Edit Profile',
                style: TextStyle(color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
