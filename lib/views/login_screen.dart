import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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
              height: MediaQuery.of(context).size.height * .5,
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              margin: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Welcome back!',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 222, 61, 104))),
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password?',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 222, 61, 104))),
                              )
                            ]),
                        const SizedBox(height: 15),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: customButton(context, title: 'Log In',
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
                              Text("Couldn't have an account",
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Register',
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

UnderlineInputBorder underLineBorder({required Color borderColor}) {
  return UnderlineInputBorder(borderSide: BorderSide(color: borderColor));
}

customButton(context,
    {required String title, required VoidCallback onPressed}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
        onPressed: onPressed,
        color: const Color.fromARGB(255, 222, 61, 104),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Text(title, style: const TextStyle(color: Colors.white))),
  );
}

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.validator,
      required this.labelText,
      required this.isPassword,
      required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final FormFieldValidator validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? isVisible : false,
        validator: widget.validator,
        cursorColor: const Color.fromARGB(255, 222, 61, 104),
        decoration: InputDecoration(
          suffix: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(isVisible
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded))
              : null,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          enabledBorder: underLineBorder(borderColor: Colors.grey.shade400),
          focusedBorder: underLineBorder(
              borderColor: const Color.fromARGB(255, 222, 61, 104)),
        ),
      ),
    );
  }
}
