import 'dart:convert' as convert;
import 'dart:io';
import 'package:broker/models/Items.dart';
import 'package:broker/screens/HomeScreen.dart';
import 'package:broker/screens/ProfilScreen.dart';
import 'package:broker/screens/TaxiScreen.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    /* Text(
      'Index 0: Taxi servece',
      style: optionStyle,
    ), */
    TaxiScreen(),
    HomeScreen(),
    /* Text(
      'Index 1: House servece',
      style: optionStyle,
    ), */
    ProfilScreen(),
    /* Text(
      'Index 2: Profile',
      style: optionStyle,
    ), */
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*  Future getData() async {
    var url =
        Uri.https('http://192.168.0.105:8000', '/api/item', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } */

  /* late List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse("http://192.168.0.105:8000/api/item"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    print(
        '*******************************************************************');
    data = json.decode(response.body);

    print(
        '*******************************************************************');

    print(data);

    return "Success!";
  } */

/*   List item = [];

  final String baseUrl = "http://192.168.0.105:8000";

  void _fetchDatafromTheServer() async {
    final Dio dio = new Dio();

    try {
      var response = await dio.get(
        "$baseUrl/api/item", 
      );
      print('//////////////////////////////////////////////////////////////');
      print(response.statusCode);
      print(response.data);
      var responseData = response.data as List;
    } on DioError catch (e) {
      print(e);
    }
  } */

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        /* iconTheme: const IconThemeData(
          color: Colors.black,
        ),
         */
        backgroundColor: Color.fromARGB(255, 223, 255, 250),
        shadowColor: Colors.transparent,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                width: 130,
                color: Color.fromARGB(255, 68, 219, 194), /* GlobalVariables.fromHex('#42C2FF') */
                image: AssetImage("assets/BROKERLOGOfull2.png"),
              ),
              /* SizedBox(
                width: 6.0,
              ),
              Text(
                "E-Shop",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ), */
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: 'Taxi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'House',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 68, 219, 194)/* GlobalVariables.fromHex('#42C2FF') */,
        /* Colors.amber[800] */
        onTap: _onItemTapped,
      ),
      /* floatingActionButton: FloatingActionButton(onPressed: () {
        print(Items);
      }), */
    );
  }
}
