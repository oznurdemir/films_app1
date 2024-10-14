import 'package:films_app/data/entity/films.dart';

class FilmsdaoRepository {
  Future<List<Films>> load_films() async{
    var filmList = <Films>[];
    var f1 = Films(id: 1,ad: "Anadoluda", image: "anadoluda.png", price: 23);
    var f2 = Films(id: 2,ad: "Django", image: "django.png", price: 23);
    var f3 = Films(id: 3,ad: "Inception", image: "inception.png", price: 23);
    var f4 = Films(id: 4,ad: "Interstellar", image: "interstellar.png", price: 23);
    var f5 = Films(id: 5,ad: "The Hateful Eight", image: "thehatefuleight.png", price: 23);
    var f6 = Films(id: 6,ad: "The Pianist", image: "thepianist.png", price: 23);
    filmList.add(f1);
    filmList.add(f2);
    filmList.add(f3);
    filmList.add(f4);
    filmList.add(f5);
    filmList.add(f6);
    return filmList;
  }
}