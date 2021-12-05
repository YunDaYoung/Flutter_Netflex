class Movie {
  final String title; //제목
  final String keyword; //키워드
  final String poster; //포스터 이미지
  final bool like; //찜하기 여부

  //생성자 생성 전에 Map형을 먼저 초기화 하는 생성자 메서드
  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like']

  //인스턴스를 출력할 때 용이하기 위해
  {
    @override
    String toString() => "Movie<$title:$keyword>";
  }
}
