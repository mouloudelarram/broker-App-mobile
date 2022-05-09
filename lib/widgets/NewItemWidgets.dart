// ignore: file_names
import 'package:broker/models/Items.dart';
import 'package:broker/screens/ItemScreen.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewItemWidget extends StatelessWidget {
  const NewItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          height: width * 1.2,
          width: width, // 0.02+0.02+0.1
          //color: Colors.red,
          child: FutureBuilder<String>(
            future: Item.getNewData(), //just to get the same results
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              print('0');
              if (snapshot.hasData) {
                print('1');
                return ListView.builder(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Items.length > 5 ? 5 : Items.length,
                  itemBuilder: (BuildContext context, int index) {
                    Item item = Items[index];
                    print('2');
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemScreen(
                            id: item.id,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.transparent,
                              width: 1),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors
                                  .transparent /* GlobalVariables.fromHex('#42C2FF') */ /* Colors.black26 */,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(width * 0.02),
                        //padding: EdgeInsets.all(width * 0.02),
                        //height: height * 0.25,
                        // width: width * 0.98,
                        child: Column(
                          children: <Widget>[
                            Container(
                              //padding: EdgeInsets.all(height * 0.01),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                //borderRadius: BorderRadius.circular(20),
                                /* border: Border(
                                  right: BorderSide(
                                      color: Color.fromARGB(255, 226, 226, 226),
                                      width: 1), 
                                ),*/
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                    /* border: Border(
                                    right: BorderSide(
                                        color:
                                            Color.fromARGB(255, 226, 226, 226),
                                        width: 1),
                                  ), */
                                    ),
                                //padding: EdgeInsets.all(width * 0.02),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: item.image,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image(
                                          /* height: width * 0.25, */

                                          width: width * 0.95,
                                          height: width * 0.9,
                                          image: NetworkImage(item.image[0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: width *0.9,
                              //height: height * 0.19,
                              padding: EdgeInsets.all(height * 0.01),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.label,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          /*  GlobalVariables.fromHex(
                                                '#42C2FF'), */
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                        ),
                                        /* style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              255, 59, 59, 61),
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                        ), */
                                      ),
                                      /* Text(
                                        "\$" + item.price.toString() + "/h",
                                        style: TextStyle(
                                            color: GlobalVariables.fromHex(
                                                '#42C2FF'),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ), */
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$" + item.price.toString() + "/j",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 68, 219, 194),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
