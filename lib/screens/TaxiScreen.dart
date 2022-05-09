import 'package:broker/screens/TaxiServeceScreens/clientTaxiScreens/clientTaxiScreen.dart';
import 'package:broker/screens/TaxiServeceScreens/taxiDriverScreens/taxiDriverScreen.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:flutter/material.dart';

class TaxiScreen extends StatefulWidget {
  const TaxiScreen({Key? key}) : super(key: key);

  @override
  _TaxiScreenState createState() => _TaxiScreenState();
}

class _TaxiScreenState extends State<TaxiScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2016/11/12/21/58/new-york-1819861_960_720.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      /* margin: EdgeInsets.all(w * 0.1), */
      width: w,
      height: h,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Row contents vertically,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ClientTaxiScreen(),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(w * 0.1),
              width: w * 0.3,
              height: w * 0.3,
              decoration: BoxDecoration(
                color: Color.fromARGB(101, 0, 0, 0),/* Colors.transparent */
                /* image: const DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  fit: BoxFit.cover,
                ), */
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  'I need a Taxi',
                  style: GlobalVariables.optionStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TaxiDriverScreen(),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(w * 0.05),
              width: w * 0.3,
              height: w * 0.3,
              decoration: BoxDecoration(
                color: Color.fromARGB(101, 0, 0, 0),/* Colors.transparent */
                /* image: const DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  fit: BoxFit.cover,
                ), */
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  'I am a Taxi driver',
                  style: GlobalVariables.optionStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
