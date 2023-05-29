import 'package:flutter/material.dart';
import 'package:tmdb/pages/descripition.dart';

// ignore: must_be_immutable
class TrendingMovie extends StatelessWidget {
  final List trending;

  const TrendingMovie({
    super.key,
    required this.trending,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Movie',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            padding: const EdgeInsets.all(8),
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    bannerurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    // ignore: prefer_interpolation_to_compose_strings
                                    posterurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launch_on: trending[index]['release_date'],
                                  )));
                    },
                    // ignore: sized_box_for_whitespace
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: trending[index]['title'] != null
                          ? Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                'https://image.tmdb.org/t/p/w500' +
                                                    trending[index]
                                                        ['backdrop_path']))),
                                  ),
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: Text(
                                        trending[index]['title'] ?? 'Loading'),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
