import 'package:films_app/ui/cubit/films_cubit.dart';
import 'package:films_app/ui/views/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/films.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    super.initState();
    context.read<FilmsCubit>().load_films(); //sayfa açıldığı anda cubitteki fonksiyon çalışacak.
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage"),),
      body: BlocBuilder<FilmsCubit, List<Films>>(
        builder: (context, filmsList){
          if(filmsList.isNotEmpty){
            return GridView.builder(
                // Yatayda iki item olsun ve her item'ın genişliği1, yüksekliği 1.8 olsun.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.8),
                itemCount: filmsList.length,
                itemBuilder: (context, index){
                  var film = filmsList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(film: film,)));
                    },
                    child: Card(
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("images/${film.image}"),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${film.price} ₺", style: const TextStyle(fontSize: 15),),
                              ElevatedButton(onPressed: (){
                                print("${film.ad} sepete eklendi.");
                              }, child: const Text("Sepet")),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
