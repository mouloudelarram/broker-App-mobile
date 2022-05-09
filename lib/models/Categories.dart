import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

class Categorie {
  int id;
  String title;
  String image;
  //contractor
  Categorie({
    required this.id,
    required this.title,
    required this.image,
  });

  
  static Future<String> getData() async {
    Categories.clear();
    var response = await http.get(
      /* will change this to an other Ip */
      Uri.parse("http://192.168.43.185:8000/api/categorie"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    var data = json.decode(response.body);
    print(json.decode(response.body));
    print(data);

    for (var i = 0; i < data.length; i++) {
      print(
          '/---------------------------------\$$i\$---------------------------------/');
        Categories.add(Categorie(
        id: i,
        title: data[i]['title'],
        image: data[i]['image'] ??  'https://media.istockphoto.com/photos/luxurious-villa-with-pool-picture-id506903162?k=20&m=506903162&s=612x612&w=0&h=ynGHs5f4bq2Ok1DyvDNFHiyboIzAwHH5QJOzSw6oe1w=',
        ));

      
    }

    return "Success!";
  }
}





List<Categorie> Categories = [
  /* Categorie(
    id: 0,
    title: 'Houses',
    image: 'assets/H1.jpeg',
  ),
  Categorie(
    id: 1,
    title: 'Terran',
    image: 'assets/H2.jpg',
  ),
   Categorie(
    id: 2,
    title: 'Appartemant',
    image: 'assets/H3.jpg',
  ),
   Categorie(
    id: 3,
    title: 'Caregorie 4',
    image: 'assets/H4.jpg',
  ), */
];