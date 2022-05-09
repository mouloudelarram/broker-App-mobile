import 'package:broker/models/Items.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemScreen extends StatefulWidget {
  final int id;

  ItemScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState(id: id);
}

class _ItemScreenState extends State<ItemScreen> {
  final int id;
  _ItemScreenState({required this.id});

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Color.fromARGB(255, 1, 20, 41)
                : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.99);
  }

/* _pageController = PageController(viewportFraction: 0.8,initialPage: 1); */

  int activePage = 0; //1

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromARGB(
            255, 68, 219, 194) /* GlobalVariables.fromHex('#42C2FF') */,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //height: height * 0.5,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: height * 0.4,
                    child: PageView.builder(
                      itemCount: Items[id].image.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        /* 
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const PageScrollPhysics(), // this for snapping
                      itemCount: Items[id].image.length,
                      itemBuilder: (BuildContext context, int index) { */
                        String image = Items[id].image[index];
                        return Center(
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(height * 0.01),
                              width: width,
                              height: height * 0.4,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(Items[id].image.length, activePage))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(height * 0.03),
              child: Center(
                child: Text(
                  Items[id].label,
                  style: TextStyle(
                      color: Color.fromARGB(
                          255, 50, 163, 144) /* Color.fromARGB(255, 0, 0, 0) */,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              /* 
              margin: EdgeInsets.all(width * 0.01), */
              child: Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Text(
                  '\$' + Items[id].price.toString() + '/j',
                  style: TextStyle(
                      color: Color.fromARGB(255, 68, 219,
                          194) /* GlobalVariables.fromHex('#000000') */,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(height * 0.01),
                padding: EdgeInsets.all(height * 0.01),
                /*  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),), */
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.bed_rounded,
                          color: /* GlobalVariables.fromHex('#42C2FF') */ Color
                              .fromARGB(255, 68, 219, 194),
                        ),
                        SizedBox(
                          width: height * 0.01,
                        ),
                        Text(
                          Items[id].rooms + ' Rooms',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.bathtub_outlined,
                          color: Color.fromARGB(255, 68, 219,
                              194) /* Color.fromARGB(255, 90, 183, 211) */,
                        ),
                        SizedBox(
                          width: height * 0.01,
                        ),
                        Text(
                          Items[id].bathrooms + ' BathRooms',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.zoom_out_map_rounded,
                          color: Color.fromARGB(255, 68, 219,
                              194) /* Color.fromARGB(255, 90, 183, 211) */,
                        ),
                        SizedBox(
                          width: height * 0.02,
                        ),
                        Text(
                          Items[id].large + 'm2',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(height * 0.01),
              child: Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Text(
                  '       ' + Items[id].description,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await launch(
                    "mailto:${Items[id].authorEmail}?subject=request to get infos&body=");
              },
              child: Container(
                margin: EdgeInsets.all(height * 0.01),
                padding: EdgeInsets.all(height * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(children: [
                  Icon(
                    Icons.email,
                    color: Color.fromARGB(
                        255, 68, 219, 194), /* Colors.orangeAccent, */
                  ),
                  SizedBox(
                    width: height * 0.02,
                  ),
                  Text(Items[id].authorEmail),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch("tel:${Items[id].authorPhone}");
              },
              child: Container(
                margin: EdgeInsets.all(height * 0.01),
                padding: EdgeInsets.all(height * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(children: [
                  Icon(
                    Icons.phone,
                    color: Color.fromARGB(
                        255, 68, 219, 194), /* Colors.orangeAccent, */
                  ),
                  SizedBox(
                    width: height * 0.02,
                  ),
                  Text(Items[id].authorPhone),
                ]),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
