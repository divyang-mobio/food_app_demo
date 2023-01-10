import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  XFile? photo;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/ella-olsson-oPBjWBCcAEo-unsplash.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              margin: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sign Up',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 222, 61, 104))),
                        const SizedBox(height: 10),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();

                              photo = await picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 50,
                              foregroundImage: (photo != null)
                                  ? FileImage(File((photo?.path).toString()))
                                  : null,
                              backgroundColor:
                                  const Color.fromARGB(255, 225, 210, 210),
                              child: (photo != null)
                                  ? null
                                  : const Icon(Icons.camera_alt_rounded,
                                      color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: nameController,
                            labelText: 'Name',
                            isPassword: false,
                            validator: (value) {
                              if (value == '') {
                                return 'Enter Name';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: emailController,
                            labelText: 'e-mail',
                            isPassword: false,
                            validator: (value) {
                              if (value == '') {
                                return 'Enter e-mail';
                              } else if (value != null &&
                                  !EmailValidator.validate(value)) {
                                return 'Enter valid e-mail address';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 5),
                        CustomTextField(
                            controller: passwordController,
                            labelText: 'Password',
                            isPassword: true,
                            validator: (value) {
                              if (value == '') {
                                return 'Enter Password';
                              } else if (value != null && value.length < 3) {
                                return 'Enter Password with more than 3 letter';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: customButton(context, title: 'Sign up',
                                onPressed: () {
                              final isValidForm =
                                  _formKey.currentState?.validate();
                              if (isValidForm != null) {
                                if (isValidForm) {
                                  print("hi");
                                }
                              }
                            })),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account ",
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text('Login',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 222, 61, 104))),
                              )
                            ]),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
