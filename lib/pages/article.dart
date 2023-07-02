import 'package:flutter/material.dart';
import 'package:wp_to_flutter/widgets/appbar.dart';

import '../widgets/autherinfo.dart';
import '../widgets/featured.dart';

class Article extends StatelessWidget {
  const Article({super.key, required this.title, required this.content, required this.author, required this.date, required this.imgurl});
  final String title;
  final String content;
  final String author;
  final String imgurl;
  final String date;
  @override
  Widget build(BuildContext context) {
    final passedData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Perform null check before accessing individual properties
    if (passedData != null) {
      final String title = passedData['title'] ?? '';
      final String content = passedData['content'] ?? '';
      final String author = passedData['author'] ?? '';
      final String date = passedData['date'] ?? '';
      final String imgurl = passedData['imgurl'] ?? '';


    };
    return  Scaffold(
      appBar: const Appba(),
    extendBodyBehindAppBar: false,
    body: ListView(
   padding: const EdgeInsets.all(10),
      children:   [
        Articleheader(header: title),
        SizedBox(height: 5,),
        Fullarticle(imgurl: imgurl,),
        SizedBox(height: 10,),
        Autherinfo(img: 'https://secure.gravatar.com/avatar/9fa358c1807aed58938ded2eb04ae06c?s=24&d=mm&r=g',name: author,date: date,),
        Read(fullstory:  content,)

      ],
    ),

    );
  }
}
