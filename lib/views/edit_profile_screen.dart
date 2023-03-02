import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'login_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  XFile? photo;
  TextEditingController nameController =
      TextEditingController(text: 'Divyang Parmar');
  TextEditingController emailController =
      TextEditingController(text: "parmardivyang159@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 222, 61, 104),
                    child: CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();

                          photo = await picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {});
                        },
                        child: CircleAvatar(
                          radius: 56,
                          foregroundImage: (photo != null)
                              ? FileImage(File((photo?.path).toString()))
                              : null,
                          backgroundColor: Colors.grey.shade500,
                          child: (photo != null)
                              ? null
                              : const Icon(Icons.person_rounded,
                                  color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                      isPassword: false,
                      validator: (value) => null),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: emailController,
                      labelText: 'e-mail',
                      isPassword: false,
                      validator: (value) => null),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Change Saved')));
                    },
                    minWidth: MediaQuery.of(context).size.width * .5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: const Color.fromARGB(255, 222, 61, 104),
                    child: const Text('Save Change',
                        style: TextStyle(color: Colors.white)),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
