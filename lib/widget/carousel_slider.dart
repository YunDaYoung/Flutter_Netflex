import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflex_flutter/model/model_movie.dart';

//상단바에 배경으로 있는 슬라이드 형태 위젯
//StatefulWidget으로 하는 이유는 찜하는 기능, 디테일 페이지 띄우는 기능을 담고있기 때문
class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({required this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  //CarouselImage에서 어느 위치에 있는지 index를 저장할 _currentPage  //그 페이지에 기록되어 있는 현재 keyword
  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    //상위클래스인 StatefulWidget에서 가져온 movies 참조
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.asset('./images/' + e.poster)).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    _currentKeyword = keywords[0];
  }

  //Carousel Slider 설치해야함
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(padding: EdgeInsets.all(20)),
          CarouselSlider(
              items: images,
              options: CarouselOptions(onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              })),
          Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
              child: Text(
                _currentKeyword,
                style: TextStyle(fontSize: 11),
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    //찜하기 버튼을 누른 여부에 따라 체크버튼 or 플러스버튼
                    children: [
                      likes[_currentPage]
                          ? IconButton(
                              onPressed: () {}, icon: Icon(Icons.check))
                          : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      const Text(
                        "내가 찜한 콘텐츠",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Text(
                          '재생',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 3),
                  child: Column(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                      const Text(
                        "정보",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicater(likes, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicater(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }

  return results;
}
