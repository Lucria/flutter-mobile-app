import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/login/auth/auth_service.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: _isLoading,
                  child: const CircularProgressIndicator()
                ),
                Image.asset('assets/animation.jpg'),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordController),
                const SizedBox(
                  height: 10,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  setState(() => _isLoading = true);
                  _authService
                    .handleSignInEmail(
                      _emailController.text.trim(),
                      _passwordController.text.trim())
                    .then((value) {
                      setState(() => _isLoading = false);
                      context.navigateTo(const HomeRoute());
                  }).catchError((error) {
                      setState(() => _isLoading = false);
                      showMessage(context, 'Error: $error');
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(255, 3, 24, 41))),
        GestureDetector(
          onTap: () {
            context.navigateTo(const SignUpScreen());
          },
          child: const Text(
            " Register now",
            style: TextStyle(
                color: Color.fromARGB(255, 3, 24, 41),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Color.fromARGB(255, 3, 24, 41)),
          textAlign: TextAlign.right,
        ),
        onPressed: () => context.navigateTo(const ResetPassword()),
      ),
    );
  }
}
