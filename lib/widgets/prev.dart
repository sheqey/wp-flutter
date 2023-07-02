import 'package:flutter/material.dart';

import 'featured.dart';


class Preview extends StatelessWidget {
  final purl;

  final prevh;
final pdate;
  final prevd;
  const Preview({super.key, this.purl, this.prevh, this.prevd, this.pdate});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [


          Container(
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:  DecorationImage(
                      image: NetworkImage(purl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                 Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pdescription(
                        desc: prevh,
                        header: prevd,

                      ),
                      Text(pdate),
                    ],
                  ),
                ),
              ],
            ),
          ),









        ],
      ),
    );
  }
}
