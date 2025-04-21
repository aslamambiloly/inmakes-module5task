import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/animations/rotator.dart';
import 'package:flutter_application_1/routes/signup.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/utils/toast.dart';
import 'package:flutter_application_1/utils/widgets.dart';
import 'package:page_transition/page_transition.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isLoading = false;

  final GlobalKey<RotatorState> rotatorKey = GlobalKey<RotatorState>();

  void delayedNavigate() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageTransition(
          child: SignupActivity(),
          childCurrent: LoginActivity(),
          type: PageTransitionType.rightToLeftJoined,
          duration: Duration(milliseconds: 500),
        ),
      );
      rotatorKey.currentState?.toggleRotate();
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'log',
                      style: TextStyle(fontSize: 22),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, right: 4, left: 4),
                        child: Text(
                          'IN',
                          style: TextStyle(color: Color(0xFFFFEA00)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 30),
                TextField(
                  autocorrect: true,
                  obscureText: true,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 12),
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                SizedBox(height: 30),
                isLoading
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        child: Container(
                          width: 50,
                          child: LinearProgressIndicator(
                            backgroundColor: Color(0xFF2F2F2F),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.grey[700]!),
                            minHeight: 20,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    : darkYellowButton(
                        'LOGIN',
                        () async {
                          if (!_validateInputs()) return;
                          setState(() {
                            isLoading = true;
                          });
                          await FirebaseAuthHelper.instance
                              .loginAccount(_email.text, _password.text)
                              .then((value) {
                            if (value == 'Logged in Successfully') {
                              Navigator.pushReplacementNamed(context, '/home');
                              ToastHelper.showSuccessToast(context, 'Welcome',
                                  'Successfully logged in to your account');
                            } else {
                              ToastHelper.showErrorToast(context, 'Oops',
                                  'Authentication failed due to some error');
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        },
                      ),
                SizedBox(height: 15),
                Rotator(key: rotatorKey),
                SizedBox(height: 15),
                darkLightButton(
                  'SIGNUP',
                  () {
                    rotatorKey.currentState?.toggleRotate();
                    delayedNavigate();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
