import 'package:flutter/material.dart';
import 'package:flutter_fruit_api/screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              size: 35,
              Icons.movie_filter_rounded,
              color: Color.fromARGB(255, 224, 117, 153),
            ),
            SizedBox(width: 8.0),
            RichText(
              // Use RichText for different text styles
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Pop',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'Corn',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.w700), // Maize yellow color
                  ),
                  TextSpan(
                    text: ' Time',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Home(),
    ),
  ));
}
