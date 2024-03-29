import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/api.dart';
import '../models/movie_model.dart';
import 'example_candidate_model.dart';

class ExampleCard extends StatefulWidget {
  final ExampleCandidateModel candidate;

  const ExampleCard({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  @override
  State<ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: upcomingMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<Movie> movies = snapshot.data!;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CupertinoColors.white,
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Flexible(
                  child: PageView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      Movie movie = movies[index];
                      return Container(
                        decoration: BoxDecoration(
                          gradient: widget.candidate.color,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.network(
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              movie.overview,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
