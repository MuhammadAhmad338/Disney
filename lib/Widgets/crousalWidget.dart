// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class CrousalWidget extends StatefulWidget {
  CrousalWidget({Key? key}) : super(key: key);

  @override
  State<CrousalWidget> createState() => _CrousalWidgetState();
}

class _CrousalWidgetState extends State<CrousalWidget> {
  List<String> images = [
    "https://d23.com/app/uploads/2019/10/00-toy-story-4-az.jpg",
    "https://d23.com/app/uploads/2019/09/1-endgame-az.jpg",
    "https://d23.com/app/uploads/2017/05/1180w-600h_051917_event-cars-3-screening.jpg",
    "https://d23.com/app/uploads/2020/04/1180w-600h_011520-disney-az-frozen2.jpg",
  ];

  int activePage = 1;
  final _pageController = PageController(initialPage: 1, viewportFraction: 0.9);

  AnimatedContainer showImage(String image, bool active) {
    double margin = active ? 0 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: margin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          itemCount: images.length,
          controller: _pageController,
          pageSnapping: true,
          onPageChanged: (page) => setState(() => activePage = page),
          itemBuilder: (context, pagePosition) {
            bool isCenter = pagePosition == activePage;
            return showImage(images[pagePosition], isCenter);
          }),
    );
  }
}
