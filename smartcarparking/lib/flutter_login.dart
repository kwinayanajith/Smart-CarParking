import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> loginUser(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost/flutter_login/api.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      print('Login successful');
    } else {
      print('Login failed');
    }
  } else {
    throw Exception('Failed to load data');
  }
}
