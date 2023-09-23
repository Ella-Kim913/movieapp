import 'package:flutter/material.dart';
import 'package:movieapp/APIModel/moviedetail.dart';
import 'package:movieapp/APIModel/moviegenres.dart';
import 'package:movieapp/APIService/api_service.dart';

class detailscreen extends StatefulWidget {
  final String poster, title;
  final int id;

  const detailscreen({
    super.key,
    required this.poster,
    required this.title,
    required this.id,
  });

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  late Future<movieDetails> movie;
  late Future<moviegenres> moviegenre;

  @override
  void initState() {
    movie = APIService.getMovieDetailsByid(widget.id.toString());
    //moviegenre = APIService.getMoviegenresByid(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 2,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 930,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${widget.poster}"),
                      fit: BoxFit.cover),
                ),
                // child: Image.network(
                //   "https://image.tmdb.org/t/p/w500/${widget.poster}",
                // ),
                child: Column(children: [
                  FutureBuilder(
                    future: movie,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // List genreList = [];

                        // for (var genre in snapshot.data!.genres.toList()) {
                        //   genreList.add(genre['name']);
                        // }
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 400),
                              Text(
                                snapshot.data!.title,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    snapshot.data!.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    " / 10",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                snapshot.data!.genres
                                    .toList()
                                    .map((e) => e['name'])
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                "Stroyline",
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                snapshot.data!.overview,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const Text("----");
                    },
                  ),
                ]),
              ),

              // FutureBuilder(
              //   future: moviegenre,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Column(
              //         children: [
              //           Text(snapshot.data!.genres['name'].toString()),
              //         ],
              //       );
              //     }
              //     return const Text("----");
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
