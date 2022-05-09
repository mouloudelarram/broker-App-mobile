import 'package:broker/models/Categories.dart';
import 'package:broker/models/Items.dart';
import 'package:broker/screens/ItemScreen.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:broker/widgets/CategoriesWidgets.dart';
import 'package:flutter/material.dart';

class ItemByCategorie extends StatefulWidget {
  late int selectedIndex;
  ItemByCategorie({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _ItemByCategorieState createState() =>
      _ItemByCategorieState(selectedIndex: this.selectedIndex);
}

class _ItemByCategorieState extends State<ItemByCategorie> {
  late int selectedIndex;

  _ItemByCategorieState({required this.selectedIndex});
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: /* GlobalVariables.fromHex('#42C2FF') */ Color
            .fromARGB(255, 68, 219, 194),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.14,
                child: FutureBuilder<String>(
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        Categorie categorie = Categories[index];
                        return GestureDetector(
                          onTap: () => {_onItemTapped(index)},
                          child: Container(
                            decoration: BoxDecoration(
                              color: (categorie.id == selectedIndex)
                                  ? /* GlobalVariables.fromHex('#42C2FF') */ Color
                                      .fromARGB(255, 68, 219, 194)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(200),
                              /* boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ], */
                            ),
                            margin: EdgeInsets.all(height * 0.02),
                            height: height * 0.1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(200),
                                    boxShadow: [
                                      BoxShadow(
                                        color: (categorie.id == selectedIndex)
                                            ? /* GlobalVariables.fromHex('#42C2FF') */ Color
                                                .fromARGB(255, 68, 219, 194)
                                            : Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Hero(
                                        tag: categorie.image,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image(
                                            height: height * 0.1,
                                            width: height * 0.15,
                                            image:
                                                NetworkImage(categorie.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                /*  Container(
                    padding: EdgeInsets.all(width * 0.03),
                    child: Text(
                      categorie.title,
                      style: TextStyle(
                          color: (categorie.id == selectedIndex)
                              ? Colors.white
                              : GlobalVariables.fromHex('#42C2FF'),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                 */
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: height * 0.80, // 0.02+0.02+0.1
                //color: Colors.red,
                child: FutureBuilder<String>(
                  future: (Item.getDataByCategorie(
                      categorie: Categories[selectedIndex].title)),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    /* if (ItemsByCategories.isEmpty) {
                      return const Center(
                        child: Text('No data found !'),
                      );
                    } else */
                    if (snapshot.hasData) {
                      if (ItemsByCategories.isEmpty) {
                        return const Center(
                          child: Text('No data found !'),
                        );
                      } else {
                        return ListView.builder(
                          physics: const PageScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: ItemsByCategories.length,
                          itemBuilder: (BuildContext context, int index) {
                            Item item = ItemsByCategories[index];
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
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 226, 226, 226),
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
                                margin: EdgeInsets.all(width * 0.01),
                                padding: EdgeInsets.all(width * 0.01),
                                //height: height * 0.25,
                                width: width * 0.98,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      //padding: EdgeInsets.all(height * 0.01),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
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
                                        padding: EdgeInsets.only(
                                            right: width * 0.02),
                                        child: Stack(
                                          children: <Widget>[
                                            Hero(
                                              tag: item.image,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image(
                                                  /* height: width * 0.25, */

                                                  width: width * 0.4,
                                                  height: width * 0.4,
                                                  image: NetworkImage(
                                                      item.image[0]),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Text(
                                                "\$" +
                                                    item.price.toString() +
                                                    "/h",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: width * 0.5,
                                      //height: height * 0.19,
                                      padding: EdgeInsets.all(height * 0.01),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.label,
                                                style: TextStyle(
                                                  color: Colors.black,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Posted By : ',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  strutStyle: StrutStyle(
                                                      fontSize: 12.0),
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors
                                                          .black, /* GlobalVariables.fromHex(
                                                '#42C2FF'), */
                                                      /* fontSize: 15,
                                            fontWeight: FontWeight.w900 */
                                                    ),
                                                    text: item.author,
                                                  ),
                                                ),
                                              ),
                                              /* Text(
                                        item.author,
                                        style: TextStyle(
                                            color: GlobalVariables.fromHex(
                                                '#42C2FF'),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ), */
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Flexible(
                                              child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                strutStyle:
                                                    StrutStyle(fontSize: 12.0),
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  text: item.description,
                                                ),
                                              ),
                                            ),
                                          ),
                                          /*  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$" + item.price.toString() + "/h",
                                        style: TextStyle(
                                            color: GlobalVariables.fromHex(
                                                '#42C2FF'),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                       GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                ItemScreen(id: item.id),
                                          ),
                                        ),
                                        child: Container(
                                          width: height * 0.05,
                                          height: height * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: GlobalVariables.fromHex(
                                                '#42C2FF'),
                                          ),
                                          child: const Icon(
                                            Icons.forward,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      ), 
                                    ],
                                  ), */
                                          /** */
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.room,
                                                color: /* GlobalVariables.fromHex(
                                                    '#42C2FF') */
                                                    Color.fromARGB(
                                                        255, 68, 219, 194),
                                                size: 15,
                                              ),
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  strutStyle: StrutStyle(
                                                      fontSize: 12.0),
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                        color: Colors.grey[300],
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    text: item.address,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons.bed_rounded,
                                                      color: Colors.grey[400],
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                      item.rooms,
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons.bathtub_outlined,
                                                      color: Colors.grey[400],
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                      item.bathrooms,
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .zoom_out_map_rounded,
                                                      color: Colors.grey[400],
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Text(
                                                      item.large + ' m2',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
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
          ),
        ),
      ),
    );
  }
}
