import 'package:flutter/material.dart';
import 'package:http/http.dart' as web;
import 'dart:convert' as convert;

import 'package:newsapp/newsslide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/readmore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var news = null;
  var url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=ed8c6a27c32a457db5bedb7844fe6bfb");
  Future getNews() async {
    final response = await web.get(url);
    if (response.statusCode == 200) {
      setState(() {
        news = convert.jsonDecode(response.body);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_chart_rounded,
              color: Colors.black,
            ),
            Text(
              'MGNEWS',
              style: GoogleFonts.amarante(
                  textStyle: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        centerTitle: true,
      ),
      // body: ReadMore(),
      body: news == null
          ? Center(
              child: CircularProgressIndicator(
              strokeWidth: 18,
              color: Colors.black,
            ))
          : NewsSlide(
              news: news['articles'],
            ),
    );
  }
}
