import 'package:flutter/material.dart';
import 'package:tmdb/pages/descripition.dart';

// ignore: must_be_immutable
class TV extends StatelessWidget {
  final List tv;

  const TV({
    super.key,
    required this.tv,
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
              'Popular TV Shows',
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
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // ignore: prefer_interpolation_to_compose_strings
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: tv[index]['original_name'] ?? '',
                                    description: tv[index]['overview'] ?? '',
                                    bannerurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                    posterurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    vote: tv[index]['vote_average'] == null
                                        ? ''
                                        : tv[index]['vote_average'].toString(),
                                    launch_on:
                                        tv[index]['release_data'] ?? '')));
                      },
                      // ignore: sized_box_for_whitespace
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: //tv[index]['original_name'] != null ?
                              Container(
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
                                                  tv[index]['poster_path']))),
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: Text(
                                      tv[index]['original_name'] ?? 'Loading'),
                                )
                              ],
                            ),
                          )
                          // : Container(),
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
