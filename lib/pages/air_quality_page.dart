import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


//fetching data from Ninja API
class AirQualityPage extends StatelessWidget {
  AirQualityPage({super.key});

  int overAQI = 0;
  Future fetchAirQualityData(String city) async {
    final url =
        Uri.parse('https://api.api-ninjas.com/v1/airquality?city=$city');
    final headers = {'X-Api-Key': 'cRby+udxXK9GKmmFl2iDdg==GzGOaaxY80YFWfuF'};

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        overAQI = body["overall_aqi"];
        //print(body); // Process the fetched data
      } else {
        //print('Request failed with status: ${response.statusCode}');
        //print('Response body: ${response.body}');
      }
    } catch (error) {
      //print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchAirQualityData("Hanoi"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(child: Text("Air quality index: $overAQI"));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
