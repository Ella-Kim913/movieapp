import 'package:flutter/material.dart';
import 'package:movieapp/screen/detailscreen.dart';

class popularcard extends StatelessWidget {
  final String poster, title;
  final int id;

  const popularcard({
    super.key,
    required this.poster,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => detailscreen(
                id: id,
                poster: poster,
                title: title,
              ),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.hardEdge,
            width: 350,
            height: 250,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/$poster",
              alignment: FractionalOffset.center,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
