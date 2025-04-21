import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/animations/button.dart';
import 'package:flutter_application_1/routes/login.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/utils/toast.dart';
import 'package:flutter_application_1/utils/widgets.dart';

import 'package:page_transition/page_transition.dart';

class SignupActivity extends StatefulWidget {
  const SignupActivity({super.key});

  @override
  State<SignupActivity> createState() => _SignupActivityState();
}

class _SignupActivityState extends State<SignupActivity>
    with SingleTickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isLoading = false;
  bool isAnimated = false;
  bool showContent = false;
  bool isRotate = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    final email = _email.text.trim();
    final password = _password.text;

    if (email.isEmpty) {
      ToastHelper.showErrorToast(context, 'Oops', 'Email can\'t be empty');
      return false;
    }
    if (!EmailValidator.validate(email)) {
      ToastHelper.showErrorToast(context, 'Oops', 'Please enter a valid email');
      return false;
    }
    if (password.isEmpty) {
      ToastHelper.showErrorToast(context, 'Oops', 'Password can\'t be empty');
      return false;
    }
    if (password.length < 6) {
      ToastHelper.showErrorToast(
          context, 'Oops', 'Password must be at least 6 characters');
      return false;
    }

    return true;
  }

  void toggleRotate() {
    setState(() {
      isRotate = !isRotate;
    });
  }

  void toggleCard() {
    if (!isAnimated) {
      setState(() {
        isAnimated = true;
      });

      Future.delayed(Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            showContent = true;
          });
        }
      });
    } else {
      setState(() {
        showContent = false;
      });

      Future.delayed(Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {
            isAnimated = false;
          });
        }
      });
    }
  }

  void toggleLoading() {
    Future.delayed(Duration(seconds: 1, milliseconds: 200), () {
      if (mounted) {
        setState(() {
          isLoading = !isLoading;
        });
      }
    });
  }

  void delayedNavigate() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageTransition(
          child: LoginActivity(),
          childCurrent: SignupActivity(),
          type: PageTransitionType.leftToRightJoined,
          duration: Duration(milliseconds: 500),
        ),
      );
      toggleRotate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                screenHeading('sign', 'UP', MainAxisAlignment.center),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: true,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 12),
                  controller: _email,
                  decoration: InputDecoration(
                      labelText: 'email',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: true,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 12),
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                SizedBox(
                  height: 30,
                ),
                isLoading
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
                        child: Container(
                          width: 50,
                          child: LinearProgressIndicator(
                            backgroundColor: Color(0xFF2F2F2F),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.grey[700]!),
                            minHeight: 20,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      )
                    : AnimatedButton(
                        label: "SIGNUP",
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'By clicking on this button, you agree to our ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins-Medium'),
                                  ),
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Bold',
                                        color: Color(0xFFffea00)),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins-Medium'),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Bold',
                                        color: Color(0xFFffea00)),
                                  ),
                                  TextSpan(
                                    text:
                                        '. Are you sure you want to continue?',
                                    style:
                                        TextStyle(fontFamily: 'Poppins-Medium'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                yellowDarkButton(
                                  'Continue',
                                  () async {
                                    if (!_validateInputs()) return;
                                    toggleCard();
                                    toggleLoading();

                                    await FirebaseAuthHelper.instance
                                        .createAccount(
                                            _email.text, _password.text)
                                        .then((value) {
                                      if (value ==
                                          'Account Created Successfully') {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/home',
                                            (context) => false);
                                        ToastHelper.showSuccessToast(
                                            context,
                                            'Welcome',
                                            'Successfully created an account');
                                      } else {
                                        ToastHelper.showErrorToast(
                                            context,
                                            'Oops',
                                            'Authentication failed : $value');
                                        toggleLoading();
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                isRotate
                    ? rotator(
                        _controller,
                        context,
                        Icon(
                          Icons.autorenew_sharp,
                          size: 14,
                          color: Colors.grey,
                        ),
                      )
                    : Icon(
                        Icons.autorenew_sharp,
                        size: 14,
                        color: Colors.grey,
                      ),
                SizedBox(
                  height: 15,
                ),
                darkLightButton("LOGIN", () {
                  toggleRotate();
                  delayedNavigate();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
