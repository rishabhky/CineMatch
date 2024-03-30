import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import '../models/movie_model.dart';
import '../models/api.dart';
import 'example_candidate_model.dart';

class ExampleCard extends StatefulWidget {
  final ExampleCandidateModel candidate;
  final int index;

  const ExampleCard({
    Key? key,
    this.index = 0,
    required this.candidate,
  }) : super(key: key);

  @override
  State<ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  late List<Future<List<Movie>>>? _moviesList;

  @override
  void initState() {
    _moviesList = [
      Api().getPopularMovies(),
      Api().getTopRatedMovies(),
      Api().getUpcomingMovies(),
    ]; // Display upcoming movies by default
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _moviesList![widget.index],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<Movie> movies = snapshot.data!;
          return AppinioSwiper(
            cardCount: movies.length,
            cardBuilder: (context, index) {
              Movie movie = movies[index];
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
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: widget.candidate.color,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.95,
                            heightFactor: 0.95,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Image.network(
                          //   'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          //   width: 200,
                          //   height: 300,
                          //   fit: BoxFit.cover,
                          // ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            movie.overview,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
