import 'package:campus_events/Provider/my_provider.dart';
import 'package:campus_events/Widgets/continue_with_google.dart';
import 'package:campus_events/Widgets/glassmorphism.dart';
import 'package:campus_events/Widgets/neumorphism.dart';
import 'package:campus_events/Widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Services/FireAuth Service/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  bool process = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool loggedIn = context.watch<MyProvider>().isLoggedIn;
    return loggedIn
        ? Lottie.network(
            "https://lottie.host/5221fcc5-1f84-4b5e-9b95-233000eb7985/JxYzxyU9Nw.json")
        : Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Glass(
                    height: 100,
                    width: 100,
                    child: Text(
                      "Logo here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  NeumorphisimContainer(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Username or Email',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.8)),
                        filled: true,
                        fillColor: Colors.deepPurple.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  NeumorphisimContainer(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.8)),
                        filled: true,
                        fillColor: Colors.deepPurple.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 240,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your login logic here
                        if (isLogin) {
                          _loginUser();
                        } else {
                          _signUpUser();
                        }
                        print('Username: ${usernameController.text}');
                        print('Password: ${passwordController.text}');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurple.shade300,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        isLogin ? 'Login' : 'Sign Up',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            process = true;
                            isLogin = !isLogin;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white.withOpacity(0.7),
                        ),
                        child: process
                            ? const CircularProgressIndicator()
                            : Text(isLogin ? 'Sign Up' : 'Login'),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white.withOpacity(0.7),
                        ),
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  const OrDivider(),
                  const GoogleSignInButton(),
                ],
              ),
            ),
          );
  }

  _loginUser() async {
    if (await Authenticate.login(
        usernameController.text, passwordController.text)) {
      _setProvider();
    } else {
      print("Login failed!");
    }
  }

  _signUpUser() async {
    if (await Authenticate.signup(
        usernameController.text, passwordController.text)) {
      _setProvider();
    } else {
      print("Login failed!");
    }
  }

  _setProvider() {
    context.read<MyProvider>().loginSuccessful();
  }
}
