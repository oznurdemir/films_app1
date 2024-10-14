import 'films.dart';

class FilmsAnswer{
  List<Films> films;
  int success;

  FilmsAnswer({required this.films, required this.success});

  factory FilmsAnswer.fromJson(Map<String, dynamic> json){
    var jsonArray = json["filmler"] as List;
    var success = json["success"] as int;
    var filmler = jsonArray.map((jsonArrayNesnesi) => Films.fromJson(jsonArrayNesnesi)).toList();
    return FilmsAnswer(films: filmler, success: success);
  }
}