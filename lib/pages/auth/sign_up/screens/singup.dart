import 'package:electro_dragon/constants/colors.dart';
import 'package:electro_dragon/main.dart';
import 'package:flutter/material.dart';

import '../../login/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: s_width,
          child: Column(
            children: [
              // Gradient Header
              Container(
                width: s_width,
                height: 290,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Color(0xFF000000),
                    ],
                    stops: [0.01, 1.0],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(36, 60, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 55),
                      Text(
                        'Welcome user',
                        style: const TextStyle(
                          fontFamily: 'SourceSerifPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 56),
                      Text(
                        'Sign up to join',
                        style: const TextStyle(
                          fontFamily: 'SourceSerifPro',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Form
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'John Doe',
                        hintStyle: TextStyle(
                          fontFamily: 'SourceSerifPro',
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 13),
                      ),
                      style: TextStyle(
                        fontFamily: 'SourceSerifPro',
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      indent: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontFamily: 'SourceSerifPro',
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                        contentPadding: EdgeInsets.only(top: 13),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontFamily: 'SourceSerifPro',
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      indent: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'SourceSerifPro',
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 13),
                      ),
                      style: TextStyle(fontFamily: 'SourceSerifPro'),
                    ),
                    Divider(
                      color: Colors.black12,
                      indent: 10,
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2563FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'or connect',
                            style: TextStyle(fontFamily: 'SourceSerifPro'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size.fromHeight(48),
                              side: BorderSide(color: primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Google',
                              style: TextStyle(
                                fontFamily: 'SourceSerifPro',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size.fromHeight(48),
                              side: BorderSide(color: primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Facebook',
                              style: TextStyle(
                                fontFamily: 'SourceSerifPro',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 82),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Have an account? ',
                              style: TextStyle(
                                fontFamily: 'SourceSerifPro',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(
                                    fontFamily: 'SourceSerifPro',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
