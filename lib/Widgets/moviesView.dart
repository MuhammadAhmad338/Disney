// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MoviesView extends StatelessWidget {
  final String title;
  final List<String> movies;
  const MoviesView({super.key, required this.title, required this.movies});

  Widget buildLogo(String coverImage) {
    return Container(
      height: 100,
      width: 120,
      margin: const EdgeInsets.all(8),
      child: Image.network(
        coverImage,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white.withOpacity(.5))),
        const SizedBox(height: 5),
        SizedBox(
          height: 180,
          child: ListView(
              scrollDirection: Axis.horizontal,
              addAutomaticKeepAlives: true,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: movies.map((e) => buildLogo(e)).toList()),
        )
      ],
    );
  }
}
