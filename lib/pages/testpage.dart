import 'package:flutter/material.dart';
import 'package:wp_to_flutter/widgets/appdrawer.dart';

import '../widgets/appbar.dart';
import '../widgets/featured.dart';
import '../widgets/prev.dart';


class home extends StatelessWidget  {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const Appba(),
     drawer: const appdrawer(),
     body: ListView(
       padding: const EdgeInsets.all(10),
          children:  [
            const Featured(
             imgurl: "https://news.switchtv.ke/wp-content/uploads/2023/06/gas-processing-plant.webp",
       ),
            const description(
             desc: 'Deputy Aconcagua breaks world record for being the world\'s stupidest person of the year 2023',
             header: 'Deputy Gachagua breaks world record for being the world\'s stupidest person of the year 2023',
             hight: 10,
       ),

            DefaultTabController(
              length: 3, // Number of tabs
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.sports_baseball),
                      ),
                      Tab(
                        icon: Icon(Icons.poll_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.library_books_sharp),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height ,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: 70, // Replace with the actual number of items
                          itemBuilder: (context, index) {
                            return const Preview(
                              purl: 'https://news.switchtv.ke/wp-content/uploads/2023/06/kenyan-shilling-bank-notes-in-various-denominations-W9AE90-e1687601065577.webp',
                              prevh: 'Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling',
                              prevd: 'Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling',
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 10, // Replace with the actual number of items
                          itemBuilder: (context, index) {
                            return const Preview(
                              purl: 'https://news.switchtv.ke/wp-content/uploads/2023/06/kenyan-shilling-bank-notes-in-various-denominations-W9AE90-e1687601065577.webp',
                              prevh: 'Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling',
                              prevd: 'Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling',
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 100, // Replace with the actual number of items
                          itemBuilder: (context, index) {
                            return const Preview(
                              purl: 'https://news.switchtv.ke/wp-content/uploads/2023/06/kenyan-shilling-bank-notes-in-various-denominations-W9AE90-e1687601065577.webp',
                              prevh: 'Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling',
                              prevd: 'Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling Unga Group Limited Attributes Loss to  Depreciating Kenyan Shilling',
                            );
                          },
                        ),
                      ],
                    ),
                  )

                ],
              ),
            )



          ],
        ),



    );
  }
}
