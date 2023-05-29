import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String name, description, bannerurl, posterurl, vote, launch_on;

  // ignore: non_constant_identifier_names
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // ignore: avoid_unnecessary_containers
      body: Container(
          child: ListView(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      ' ⭐ Average Rating - ' + vote,
                      style: const TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              // ignore: prefer_if_null_operators, unnecessary_null_comparison
              name != null ? name : 'Not Loaded',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            // ignore: prefer_interpolation_to_compose_strings
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              'Releasing on' + launch_on,
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: 150,
                child: Image.network(posterurl),
              ),
              Flexible(
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
