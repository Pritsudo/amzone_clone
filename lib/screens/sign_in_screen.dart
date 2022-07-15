import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  Container(
                      height: screenSize.height * 0.6,
                      width: screenSize.width * 0.8,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign-In',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 33),
                          ),
                          TextFieldWidget(
                            title: 'email',
                            controller: emailController,
                            obscureText: false,
                            hintText: 'Enter your email',
                          ),
                          TextFieldWidget(
                            title: 'password',
                            controller: passwordController,
                            obscureText: true,
                            hintText: 'Enter your password',
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      letterSpacing: 0.6, color: Colors.black),
                                ),
                                color: yellowColor,
                                isLoading: false,
                                onPressed: () async {}),
                          )
                        ],
                      )),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'New to amazon',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                  CustomMainButton(
                      child: Text(
                        'Create as Amazone Account',
                        style:
                            TextStyle(letterSpacing: 0.6, color: Colors.black),
                      ),
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreeen()));
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}