import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

class Item {
  int id;
  String label;
  String description;
  double price;
  String rooms;
  String bathrooms;
  String large;
  String categorie;
  String address;
  String author;
  String authorEmail;
  String authorPhone;
  List<String> image;
  //contractor
  Item({
    required this.id,
    required this.label,
    required this.price,

    required this.rooms,
    required this.bathrooms,
    required this.large,

    required this.address,
    required this.author,
    required this.authorEmail,
    required this.authorPhone,
    required this.categorie,
    required this.description,
    required this.image,
  });

  static Future<String> getData() async {
    Items.clear();
    var response = await http.get(
      /* will change this to an other Ip */
      Uri.parse("http://192.168.43.185:8000/api/item"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    var data = json.decode(response.body);
    print(json.decode(response.body));
    print(data);

    for (var i = 0; i < data.length; i++) {
      print(
          '/---------------------------------\$$i\$---------------------------------/');
      List<String> images = [];
      for (var j = 0; j < data[i]['image'].length; j++) {
        images.add(data[i]['image'][j]['path']);
      }
      if (images.isEmpty) {
        images.add(
            'https://media.istockphoto.com/photos/luxurious-villa-with-pool-picture-id506903162?k=20&m=506903162&s=612x612&w=0&h=ynGHs5f4bq2Ok1DyvDNFHiyboIzAwHH5QJOzSw6oe1w=');
      }
      Items.add(Item(
        id: i,
        image: images,
        label: data[i]['label'],
        description: data[i]['description'],
        price: data[i]['price'],
        rooms: data[i]['rooms'].toString(),
        bathrooms: data[i]['bathrooms'].toString(),
        large: data[i]['large'].toString(),
        categorie: data[i]['categorie'],
        address: data[i]['address'],
        author: data[i]['author'],
        authorEmail: data[i]['authorEmail'],
        authorPhone: data[i]['authorPhone'],
      ));
    }

    return "Success!";
  }

  
  static Future<String> getNewData() async {
    //Items.clear();
    var response = await http.get(
      /* will change this to an other Ip */
      Uri.parse("http://192.168.43.185:8000/api/item"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    var data = json.decode(response.body);
    print(json.decode(response.body));
    print(data);
    
    return "Success!";
  }

  static Future<String> getDataByCategorie({String categorie = ''}) async {
    ItemsByCategories.clear();
    print('************///************************');
    print(categorie);
    var response = await http.get(
      /* will change this to an other Ip */
      Uri.parse("http://192.168.43.185:8000/api/item"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    var data = json.decode(response.body);
    print(json.decode(response.body));
    print(data);

    for (var i = 0; i < data.length; i++) {
      if (categorie == '' || categorie == data[i]['categorie']) {
        // ignore: avoid_print
        print(
            '/---------------------------------\$$i\$---------------------------------/');
        List<String> images = [];
        for (var j = 0; j < data[i]['image'].length; j++) {
          images.add(data[i]['image'][j]['path']);
        }
        if (images.isEmpty) {
          images.add(
              'https://media.istockphoto.com/photos/luxurious-villa-with-pool-picture-id506903162?k=20&m=506903162&s=612x612&w=0&h=ynGHs5f4bq2Ok1DyvDNFHiyboIzAwHH5QJOzSw6oe1w=');
        }
        ItemsByCategories.add(Item(
          id: i,
          image: images,
          label: data[i]['label'],
          description: data[i]['description'],
          price: data[i]['price'],
          rooms: data[i]['rooms'].toString(),
          bathrooms: data[i]['bathrooms'].toString(),
          large: data[i]['large'].toString(),
          categorie: data[i]['categorie'],
          address: data[i]['address'],
          author: data[i]['author'],
          authorEmail: data[i]['authorEmail'],
          authorPhone: data[i]['authorPhone'],
        ));
      }
    }

    return "Success!";
  }
}

List /* <Item> */ ItemsByCategories = [];

List /* <Item> */ Items = [
  /*  Item(
    id: 0,
    label: 'Houses 1',
    image: ['assets/H1.jpeg','assets/H2.jpg','assets/H3.jpg','assets/H4.jpg'],
    price: 600.0,
    address: 'essaouira',
    author: 'user1',
    categorie: 'Houses',
    description:  'You can also use house to refer to groups of people. The House of Tudor is an English royal family. Governing bodies can be houses: the Houses of Parliament, in Britain, or the House of Representatives, in the US. In a theater, the house is the audience. When house is a verb, meaning to provide a house for, as in “where are you going to house all your guests?” — it’s pronounced with a -z-, rather than an -s-',
  ),
  Item(
    id: 1,
    label: 'House 2',
    image: ['assets/H5.jpg','assets/H6.jpg','assets/H1.jpeg','assets/H2.jpg'],
    price: 659.0,
    address: 'Marrakech',
    author: 'user2',
    categorie: 'Houses',
    description:  'You can also use house to refer to groups of people. The House of Tudor is an English royal family. Governing bodies can be houses: the Houses of Parliament, in Britain, or the House of Representatives, in the US. In a theater, the house is the audience. When house is a verb, meaning to provide a house for, as in “where are you going to house all your guests?” — it’s pronounced with a -z-, rather than an -s-',
  ),
  Item(
    id: 2,
    label: 'Houses 1',
    image: ['assets/H5.jpg','assets/H6.jpg','assets/H1.jpeg','assets/H2.jpg'],
    price: 600.0,
    address: 'essaouira',
    author: 'user1',
    categorie: 'Houses',
    description:  'You can also use house to refer to groups of people. The House of Tudor is an English royal family. Governing bodies can be houses: the Houses of Parliament, in Britain, or the House of Representatives, in the US. In a theater, the house is the audience. When house is a verb, meaning to provide a house for, as in “where are you going to house all your guests?” — it’s pronounced with a -z-, rather than an -s-',
  ),
  Item(
    id: 3,
    label: 'House 2',
    image: ['assets/H5.jpg','assets/H6.jpg','assets/H1.jpeg','assets/H2.jpg'],
    price: 659.0,
    address: 'Marrakech',
    author: 'user2',
    categorie: 'Houses',
    description:  'You can also use house to refer to groups of people. The House of Tudor is an English royal family. Governing bodies can be houses: the Houses of Parliament, in Britain, or the House of Representatives, in the US. In a theater, the house is the audience. When house is a verb, meaning to provide a house for, as in “where are you going to house all your guests?” — it’s pronounced with a -z-, rather than an -s-',
  ),
  Item(
    id: 4,
    label: 'Houses 1',
    image: ['assets/H5.jpg','assets/H6.jpg','assets/H1.jpeg','assets/H2.jpg'],
    price: 600.0,
    address: 'essaouira',
    author: 'user1',
    categorie: 'Houses',
    description:  'You can also use house to refer to groups of people. The House of Tudor is an English royal family. Governing bodies can be houses: the Houses of Parliament, in Britain, or the House of Representatives, in the US. In a theater, the house is the audience. When house is a verb, meaning to provide a house for, as in “where are you going to house all your guests?” — it’s pronounced with a -z-, rather than an -s-',
  ),
  Item(
    id: 5,
    label: 'House 2',
    image: ['assets/H5.jpg','assets/H6.jpg','assets/H1.jpeg','assets/H2.jpg'],
    price: 659.0,
    address: 'Marrakech',
    author: 'user2',
    categorie: 'Houses',
    description:  'You can also use house to refer to groups of people. The House of Tudor is an English royal family. Governing bodies can be houses: the Houses of Parliament, in Britain, or the House of Representatives, in the US. In a theater, the house is the audience. When house is a verb, meaning to provide a house for, as in “where are you going to house all your guests?” — it’s pronounced with a -z-, rather than an -s-',
  ), */
];

/* class ImagesItem {
  String path;
  ImagesItem({required this.path});
}

List<ImagesItem> Images = [
  ImagesItem(path: 'assets/1.jpg'),
  ImagesItem(path: 'assets/2.jpg'),
  ImagesItem(path: 'assets/H3.jpg'),
  ImagesItem(path: 'assets/H4.jpg'),
]; */


