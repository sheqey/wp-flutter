import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final imgurl;
  const Featured({super.key, this.imgurl});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imgurl),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('latest'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );


  }
}
class description extends StatelessWidget {
  final desc;
  final header;
  final double hight;
  const description({super.key, this.desc, this.header, required this.hight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: hight),
        Text(desc,   overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Montserrat',
            height: 1.2,
            fontWeight: FontWeight.w900,

            // fontFamily:Montserrat,


          ),
        ),
        const SizedBox(height: 5,),
        Text(header,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(
            height: 1.2,
            fontSize: 10,

          ),
        ),
      ],
    );
  }
}






class pdescription extends StatelessWidget {
  final desc;
  final header;
  final hight;
  const pdescription({super.key, this.desc, this.header, this.hight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: hight),
        Text(desc,   overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Montserrat',
            height: 1.2,
            fontWeight: FontWeight.w900,

            // fontFamily:Montserrat,


          ),
        ),
        const SizedBox(height: 5,),
        Text(
          'Category: ${header}',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}









class Fullarticle extends StatelessWidget {
  final imgurl;
  const Fullarticle({super.key, this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imgurl),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    //S  color: Colors.blue.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                   // child: const Text('Featured'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );


  }
}

class Articleheader extends StatelessWidget {
  final header;
  const Articleheader({super.key,  this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(header,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            height: 1.2,
            fontSize: 15,

          ),
        ),
      ],
    );
  }
}