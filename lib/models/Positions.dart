import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

class Position {
  int id;
  double longitude;
  double latitude;
  String title;
  //contractor
  Position({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.title,
  });

  
  static Future<String> getData() async {
    //positions.clear();
    var response = await http.get(
      /* will change this to an other Ip */
      Uri.parse("http://192.168.43.185:8000/api/position"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    var data = json.decode(response.body);
    print(json.decode(response.body));
    print(data);

    for (var i = 0; i < data.length; i++) {
      print(
          '/---------------------------------\$$i\$---------------------------------/');
      
      positions.add(Position(
        id: i,
        latitude: data[i]['latitude'].toDouble(),
        longitude: data[i]['longitude'].toDouble(),
        title: '',
      ));
    }

    return "Success!";
  }
  static resetList() {
    positions.clear();
  }
}

List<Position> positions = [
  Position(title: "one", id: 1, latitude: 23.7985053, longitude: 90.3842538),
  Position(title: "two", id: 2, latitude: 23.802236, longitude: 90.3700),
  Position(title: "three", id: 3, latitude: 23.8061939, longitude: 90.3771193),
  Position(
    id: 0,
    latitude: 31.511465723874213,
    longitude: -9.769851802973353,
    title: 'Dar Souiri',
  ),
  Position(
    id: 1,
    latitude: 31.512142010542288,
    longitude: -9.770698661868849,
    title: 'La Tour de l\'Horloge ',
  ),
  Position(
    id: 2,
    latitude: 31.511607623093123,
    longitude: -9.771878228032707,
    title: 'Destination Moulay Hassa ',
  ),
  Position(
    id: 3,
    latitude: 31.51012515130355,
    longitude: -9.7737764628743,
    title: 'Port de Pêche ',
  ),
  Position(
    id: 4,
    latitude: 31.510288963304767,
    longitude: -9.77418318915918,
    title: 'Sqala du port',
  ),
  Position(
    id: 5,
    latitude: 31.51004244678904,
    longitude: -9.773643415796132,
    title: 'Porte de la Marine',
  ),
  Position(
    id: 6,
    latitude: 31.510391169934767,
    longitude: -9.773579042780135,
    title: 'Face à l\'océan',
  ),
];
