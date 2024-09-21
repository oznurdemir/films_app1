import 'package:films_app/data/entity/films.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  Films film;
  Detail({required this.film});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.film.ad),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.film.image}"),
            Text("${widget.film.price} ₺", style: const TextStyle(fontSize: 36),)
          ],
        ),
      ),
    );
  }
}
