import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/utils/toast.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<User>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = _apiService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text('users'),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, right: 4, left: 4),
                  child: Text(
                    'PRO',
                    style: TextStyle(color: Color(0xFFFFEA00)),
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () async {
                    await FirebaseAuthHelper.instance.logout().then((onValue) {
                      if (onValue == 'Logged out Successfully') {
                        ToastHelper.showSuccessToast(context, 'Success',
                            'You are successfully logged out');
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (context) => false);
                      } else {
                        ToastHelper.showErrorToast(context, 'Oops!',
                            'There seems to be some issues due to $onValue');
                      }
                    });
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Color(0xFFFFEA00),
                  )),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          final users = snapshot.data!;
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Color(0xff2f2f2f),
                                radius: 40,
                                foregroundColor: Colors.white,
                                child: Text(
                                  user.id.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold', fontSize: 30),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            Center(
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 15),
                                    ),
                                  ]),
                            ),
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    user.email,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
