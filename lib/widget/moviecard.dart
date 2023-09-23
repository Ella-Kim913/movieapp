import 'package:flutter/material.dart';
import 'package:movieapp/screen/detailscreen.dart';

class moviecard extends StatelessWidget {
  final String poster, title;
  final int id;

  const moviecard({
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
            width: 170,
            height: 170,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/$poster",
              alignment: FractionalOffset.center,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              width: 170,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
