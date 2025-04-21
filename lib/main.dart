import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/routes/login.dart';
import 'package:flutter_application_1/routes/signup.dart';
import 'package:flutter_application_1/routes/home.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/utils/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainActivity());
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => CheckUser(),
        '/login': (context) => LoginActivity(),
        '/home': (context) => UserListScreen(),
        '/signup': (context) => SignupActivity(),
      },
    );
  }
}

class HomeActivity {}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => checkUser());
  }

  void checkUser() async {
    bool isLoggedIn = await FirebaseAuthHelper.instance.isCurrentUser();
    if (mounted) {
      Navigator.pushReplacementNamed(context, isLoggedIn ? '/home' : '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 50,
        child: LinearProgressIndicator(
          backgroundColor: Color(0xFF2F2F2F),
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[700]!),
          minHeight: 20,
          borderRadius: BorderRadius.circular(20),
        ),
      )),
    );
  }
}
