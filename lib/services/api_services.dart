import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));
    if (response.statusCode == 200) {
      return User.parseList(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
