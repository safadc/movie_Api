import 'package:flutter/material.dart';
import 'package:tmdb/widgets/toprated.dart';
import 'package:tmdb/widgets/trending.dart';
import 'package:tmdb/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedMovies = [];
  List tv = [];
  final String apiKey = 'f01b64f8592a57f6a790cd4693d4e237';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDFiNjRmODU5MmE1N2Y2YTc5MGNkNDY5M2Q0ZTIzNyIsInN1YiI6IjY0NzE4M2IzOWFlNjEzMDEwNDVhMDlmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.X2_Dy7lCVQo8ScWU4sP9vizZUhHIlzIpidmjSDkYj-0';
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    // //ignore: unused_local_variable
    TMDB tmdbWithCustomlogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingresult = await tmdbWithCustomlogs.v3.trending.getTrending();
    // //ignore: unused_local_variable
    Map topratedresult = await tmdbWithCustomlogs.v3.movies.getTopRated();
    // ignore: unused_local_variable
    Map tvresult = await tmdbWithCustomlogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingresult['results'];
      topratedMovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    //// ignore: avoid_print
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'MovieApp❤',
          style: TextStyle(
              color: Colors.white70, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          TrendingMovie(trending: trendingMovies),
          TopRated(toprated: topratedMovies),
          TV(tv: tv),
        ],
      ),
    );
  }
}
