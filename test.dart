  import 'dart:convert';
import 'package:http/http.dart' as http;
void main(){

Future<void> fetchData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/test'));
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    // Process the data as needed
    print(data);
  } else {
    throw Exception('Failed to load data from API');
  }
}
fetchData();
}