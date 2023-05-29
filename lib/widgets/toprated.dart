import 'package:flutter/material.dart';
import 'package:tmdb/pages/descripition.dart';

// ignore: must_be_immutable
class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({
    super.key,
    required this.toprated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TopRated Movies',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: toprated[index]['title'] ?? '',
                                    description:
                                        toprated[index]['overview'] ?? '',
                                    bannerurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['backdrop_path'],
                                    posterurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path'],
                                    vote:
                                        toprated[index]['vote_average'] == null
                                            ? ''
                                            : toprated[index]['vote_average']
                                                .toString(),
                                    launch_on: toprated[index]
                                            ['release_data'] ??
                                        '')));
                      },
                      // ignore: sized_box_for_whitespace
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            // ignore: prefer_interpolation_to_compose_strings
                                            'https://image.tmdb.org/t/p/w500' +
                                                toprated[index]
                                                    ['poster_path']))),
                              ),
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child:
                                    Text(toprated[index]['title'] ?? 'Loading'),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
