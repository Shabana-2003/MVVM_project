// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {
//   final String baseUrl;

//   ApiService({required this.baseUrl});

//   Future<List<dynamic>> fetchUsers() async {
//     final response = await http.get(Uri.parse(baseUrl));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       return data['results']; // Assuming 'results' is the key holding the list of users.
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }
// }
