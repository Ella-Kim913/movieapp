import 'package:flutter/material.dart';
import 'package:movieapp/APIModel/movielist.dart';
import 'package:movieapp/APIService/api_service.dart';
import 'package:movieapp/widget/moviecard.dart';
import 'package:movieapp/widget/popularcard.dart';

// ignore: camel_case_types
class homescreen extends StatelessWidget {
  homescreen({super.key});

  final Future<List<movielist>> nowincinema = APIService.getnowincinema();
  final Future<List<movielist>> popularmovie = APIService.getPopularMovie();
  final Future<List<movielist>> comingsoon = APIService.getcomingsoonmovie();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 80,
            ),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "popular movie".toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FutureBuilder(
                  future: popularmovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              child: listmakepopular(snapshot),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                Text(
                  "now in cinemas".toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FutureBuilder(
                  future: nowincinema,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              child: listmake(snapshot),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                Text(
                  "coming soon".toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FutureBuilder(
                  future: comingsoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              child: listmake(snapshot),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  ListView listmake(AsyncSnapshot<List<movielist>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      itemBuilder: (context, index) {
        var movielist = snapshot.data![index];
        return moviecard(
          poster: movielist.poster,
          title: movielist.title,
          id: movielist.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}

ListView listmakepopular(AsyncSnapshot<List<movielist>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 5,
    ),
    itemBuilder: (context, index) {
      var movielist = snapshot.data![index];
      return popularcard(
        poster: movielist.poster,
        title: movielist.title,
        id: movielist.id,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 20,
    ),
  );
}
