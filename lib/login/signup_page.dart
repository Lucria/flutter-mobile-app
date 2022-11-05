import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/home_navigation_widget.dart';

import '../util/util_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      addUserDetails(
        _firstnameController.text.trim(),
        _lastnameController.text.trim(),
        _emailController.text.trim(),
        _genderController.text.trim(),
        int.parse(_ageController.text.trim()),
      );
    }
  }

  Future addUserDetails(String firstname, String lastname, String email,
      String gender, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
      'email': email,
      'gender': gender,
      'age': age,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    reusableTextField("Enter First Name", Icons.person_outline,
                        false, _firstnameController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Last Name", Icons.person_outline,
                        false, _lastnameController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Age", Icons.person_outline, false, _ageController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Gender", Icons.person_outline, false,
                        _genderController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Email", Icons.email, false, _emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Confirm Password", Icons.lock_outlined, true,
                        _passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      )
                          .then((value) {
                        showMessage(context, "Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const HomeTabNavigationWidget()));
                      }).onError((error, stackTrace) {
                        showMessage(context, "Error ${error.toString()}");
                      });
                    }),
                  ],
                ),
              ))),
    );
  }
}
