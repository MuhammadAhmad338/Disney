// ignore_for_file: file_names, unused_local_variable, prefer_const_declarations, prefer_const_constructors, sized_box_for_whitespace
import 'package:disney/Widgets/crousalWidget.dart';
import 'package:disney/Widgets/moviesView.dart';
import 'package:disney/Widgets/studioLogosWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appbarImage = "assets/disney_plus_logo.png";
    const mickeyMouse = "assets/disney_plus_logo.png";
    const ktoolbarheight = 56.0;
    const kBackgroundColor = Color.fromARGB(30, 34, 49, 255);
    List<String> covers = [
      'https://media.comicbook.com/uploads1/2015/06/antmanposter-139745.jpg',
      'https://i.pinimg.com/236x/92/5d/e8/925de870f00d0f1f83502772bbc6c84c.jpg',
      'https://hips.hearstapps.com/digitalspyuk.cdnds.net/13/18/comics-infinity-1-cover-artwork.jpg',
      'https://i.pinimg.com/originals/69/3b/5a/693b5ae03a25cb9d3a6ce3f567d1f817.jpg',
      'https://i.pinimg.com/736x/fd/12/df/fd12dfea52d3f17c9ef93a148ccf2c4c.jpg',
    ];

    appBarWidget() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: ktoolbarheight,
          child: Image.asset(appbarImage,
              color: Colors.white, fit: BoxFit.contain),
        ),
        toolbarHeight: ktoolbarheight,
      );
    }

    bottomNavigatorFunction() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 0.5, thickness: 0.5, color: Colors.white12),
          BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(.5),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: "Downloads"),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(mickeyMouse),
                        radius: 15,
                      ),
                    ),
                    label: "Profile")
              ]),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBarWidget(),
      body: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 5),
          CrousalWidget(),
          const SizedBox(height: 8),
          StudioLogo(),
          const SizedBox(height: 15),
          MoviesView(title: 'Recommended for You', movies: covers),
          const SizedBox(height: 15),
          MoviesView(title: "Hit Movies", movies: covers)
        ],
      ),
      bottomNavigationBar: bottomNavigatorFunction(),
    );
  }
}
