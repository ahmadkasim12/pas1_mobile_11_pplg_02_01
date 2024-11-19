import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11_pplg_02_01/api/sport_api/SportModel.dart';

class SportApiService {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<Team>> fetchData () async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if(response.statusCode == 200){
      final jsonData = json.decode(response.body);
      List data = jsonData['teams'];
      return data.map((json) => Team.fromJson(json)).toList();
    }
    else {
      throw Exception('Failed to load posts');
    }
  }

}