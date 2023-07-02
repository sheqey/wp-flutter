import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/dom.dart' as dom;

class Autherinfo extends StatelessWidget {
  final img;

  final name;

  final date;

  const Autherinfo({super.key, this.img, this.name, this.date});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(img),
        ),
        const SizedBox(width: 8),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Follow'),
        ),
      ],
    );
  }
}



class Read extends StatelessWidget {
  final String fullstory;

  const Read({Key , required this.fullstory});





  void _launchUrl(String? url, Map<String, String> attributes, dom.Element? element) async {
    if (await canLaunch(url!)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          data: fullstory,
          style: {
            'body': Style(fontSize: FontSize.medium),
            'em': Style(fontSize: FontSize.large, color: Colors.red),
            'img': Style(
              width: Width(200),  // Adjust the width as per your requirements
              height: Height(200), // Adjust the height as per your requirements
            ),
          },
          onLinkTap: (url, attributes, element) {
            _launchUrl(url, attributes, element);
          },
        ),
      ],
    );
  }
}





