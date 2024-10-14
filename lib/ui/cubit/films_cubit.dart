import 'package:films_app/data/entity/films.dart';
import 'package:films_app/data/repo/filmsdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmsCubit extends Cubit<List<Films>>{
  FilmsCubit():super(<Films>[]);
  var frepo = FilmsdaoRepository();

  Future<void> load_films() async{
      var list = await frepo.load_films();
      emit(list);
  }

}