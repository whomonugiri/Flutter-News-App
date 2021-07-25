import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsapp/slide.dart';

class NewsSlide extends StatelessWidget {
  final news;

  NewsSlide({this.news, Key? key}) : super(key: key);

  final List<Widget> name = [Text('data')];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // return Text(news[0]['title'].toString());
        return CarouselSlider(
          options: CarouselOptions(
              height: double.maxFinite,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal
              // autoPlay: false,
              ),
          items: news
              .map<Widget>((item) => Slide(
                    image: item['urlToImage'],
                    title: item['title'],
                    time: item['publishedAt'],
                    content: item['content'],
                    author: item['author'],
                    source: item['source']['name'],
                    pageurl: item['url'],
                  ))
              .toList(),
        );
      },
    );
  }
}
