
class Films {
  int id;
  String ad;
  String image;
  int price;

  Films({required this.id, required this.ad, required this.image, required this.price});

  factory Films.fromJson(Map<String, dynamic> json){
    return Films(id: json["id"] as int, ad: json["ad"] as String, image: json["resim"] as String, price: json["fiyat"] as int);
  }
}