import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzy/screens/homepage.dart';
import 'package:pizzy/services/authentication.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () => loginSheet(context),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () => signupSheet(context),
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'enter email',
                          hintStyle: TextStyle(color: Colors.black)),
                      controller: emailController,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'enter password',
                          hintStyle: TextStyle(color: Colors.black)),
                      controller: passwordController,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () => Provider.of<Authentication>(context,
                              listen: false)
                          .loginAccount(
                              emailController.text, passwordController.text)
                          .whenComplete(() => {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: const HomePage(),
                                        type: PageTransitionType.leftToRight))
                              }),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          );
        });
  }

  signupSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'enter email',
                          hintStyle: TextStyle(color: Colors.black)),
                      controller: emailController,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'enter password',
                          hintStyle: TextStyle(color: Colors.black)),
                      controller: passwordController,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () => Provider.of<Authentication>(context,
                              listen: false)
                          .createAccount(
                              emailController.text, passwordController.text)
                          .whenComplete(() => {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: const HomePage(),
                                        type: PageTransitionType.leftToRight))
                              }),
                      child: const Text(
                        'Sign  up',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
