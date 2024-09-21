import 'package:films_app/ui/views/detail.dart';
import 'package:flutter/material.dart';

import '../../data/entity/films.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage"),),
      body: FutureBuilder<List<Films>>(
        future: load_films(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var filmsList = snapshot.data;
            return GridView.builder(
                // Yatayda iki item olsun ve her item'ın genişliği1, yüksekliği 1.8 olsun.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.8),
                itemCount: filmsList!.length,
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
