import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatelessWidget {
  const Home({super.key});

  Future<dynamic> getName() async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie', {
      'api_key': '805715b18767fdba3f5fee785dbce7c4',
      'language': 'en-US',
    });
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse?['results']);
        return jsonResponse?['results'];
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }

    // return Future.delayed(const Duration(seconds: 2), () => "Fruity Vice");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: ListView.builder(
                  // itemCount: 3,
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) {
                    // return Text("hi");
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original${snapshot.data[index]['backdrop_path']}', // image URL
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            // Title
                            Text(
                              snapshot.data[index]["title"],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            // Rating
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                Text(
                                    '${snapshot.data[index]["vote_average"].toStringAsFixed(1)}/10'),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            // Details (Last update, runtime)
                            Row(
                              children: [
                                Text(
                                  'Release Date: ${snapshot.data[index]['release_date']}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(Icons.fireplace_rounded,
                                        color:
                                            Color.fromARGB(255, 224, 117, 153)),
                                    Text(snapshot.data[index]["popularity"]
                                        .toStringAsFixed(2)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        });
  }
}
