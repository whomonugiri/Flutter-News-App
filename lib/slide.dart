import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/readmore.dart';

class Slide extends StatelessWidget {
  var image;
  var title;
  var time;
  var content;
  var source;
  var author;
  var pageurl;
  Slide(
      {this.image,
      this.title,
      this.time,
      this.content,
      this.source,
      this.author,
      this.pageurl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (content != null) {
      List temp = content.split("[").toList();

      content = temp[0];
    } else {
      content = '';
    }
    author == null ? author = '' : author = '- ' + author;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  image == "" || image == null
                      ? 'https://i.stack.imgur.com/y9DpT.jpg'
                      : '$image',
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : LinearProgressIndicator(
                            backgroundColor: Colors.black54,
                            color: Colors.black87,
                            minHeight: 200,
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!.toInt()
                                : null,
                          );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content == ''
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$content',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  '$time $author',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  '- $source',
                  style: GoogleFonts.architectsDaughter(),
                ),
              ),
              MaterialButton(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return ReadMore(
                        pageurl: pageurl,
                      );
                    }));
                  },
                  child: Text(
                    'Read More',
                    style: TextStyle(color: Colors.white),
                  ),
                  // color: Colors.red[500],
                  color: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
