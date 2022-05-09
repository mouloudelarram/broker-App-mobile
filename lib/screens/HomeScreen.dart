import 'package:broker/models/Items.dart';
import 'package:broker/screens/ItemScreen.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:broker/widgets/AllItemWidgets.dart';
import 'package:broker/widgets/CategoriesWidgets.dart';
import 'package:broker/widgets/ItemWidgets.dart';
import 'package:broker/widgets/NewItemWidgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchFieldController = TextEditingController();
  List SearchResult = [];
  void searchOptions(String searchFieldController) {
    SearchResult.clear();
    setState(() {
      for (var item in Items) {
        if (item.address
                .toLowerCase()
                .contains(searchFieldController.toLowerCase()) ||
            item.label
                .toLowerCase()
                .contains(searchFieldController.toLowerCase()) ||
            item.description
                .toLowerCase()
                .contains(searchFieldController.toLowerCase()) ||
            item.categorie
                .toLowerCase()
                .contains(searchFieldController.toLowerCase()) ||
            item.author
                .toLowerCase()
                .contains(searchFieldController.toLowerCase())) {
          SearchResult.add(item);
        }
      }
      //Items = SearchResult;
      print(
          '*/*/************************************************************/*/*/*/');
      print(SearchResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: searchFieldController.text.isEmpty
          ? Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(height * 0.02),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5),
                              //color: GlobalVariables.fromHex('#42C2FF'),
                            ),
                          ],
                        ),
                        child: TextField(
                          //onChanged: searchOptions,
                          onSubmitted: searchOptions,
                          controller: searchFieldController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 68, 219,
                                  194), /* GlobalVariables.fromHex('#42C2FF'), */
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 68, 219, 194),
                                /* GlobalVariables.fromHex('#42C2FF'), */
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CategoriesWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Selected just for you',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AllItemWidgets(),
                              ),
                            ),
                            /* onTap: () async {
                  await launch('https://visitessaouira.net/',
                      forceSafariVC: false);
                }, */
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Color.fromARGB(255, 68, 219, 194),
                                /* GlobalVariables.fromHex('#42C2FF'), */
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ItemWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Item added today',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AllItemWidgets(),
                              ),
                            ),
                            /* onTap: () async {
                  await launch('https://visitessaouira.net/',
                      forceSafariVC: false);
                }, */
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Color.fromARGB(255, 68, 219, 194),
                                /* GlobalVariables.fromHex('#42C2FF'), */
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    NewItemWidget(),
                    /* ItemWidget(),
                      ItemWidget(), */
                    Container(
                      padding: EdgeInsets.all(height * 0.02),
                      color: Colors.grey[200],
                      child: Center(
                        child: Column(children: [
                          Center(
                            child: Text(
                              'Use this form to apply for a re-entry permit, refugee travel document, advance parole travel document (including parole into the U.S. for humanitarian reasons), or advance permission to travel for CNMI long-term residents.',
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(width * 0.02),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    width: 130,
                                    color: Color.fromARGB(255, 68, 219, 194),
                                    /* GlobalVariables.fromHex('#42C2FF') */
                                    image: AssetImage(
                                        "assets/BROKERLOGOfull2.png"),
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
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : (SearchResult.isEmpty)
              ? Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(height * 0.02),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5),
                                  //color: GlobalVariables.fromHex('#42C2FF'),
                                ),
                              ],
                            ),
                            child: TextField(
                              //onChanged: searchOptions,
                              onSubmitted: searchOptions,
                              controller: searchFieldController,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 68, 219,
                                      194), /* GlobalVariables.fromHex('#42C2FF'), */
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 68, 219, 194),
                                    /* GlobalVariables.fromHex('#42C2FF'), */
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(width * 0.01),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Search for ',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[300]),
                                ),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 12.0),
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500]),
                                      text: searchFieldController.text,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(width * 0.05),
                                  onPressed: () => {
                                    setState(
                                        () => {searchFieldController.clear()})
                                  },
                                  icon: const Icon(
                                    Icons.highlight_remove,
                                    size: 30,
                                    color: Color.fromARGB(255, 68, 219, 194),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(height * 0.05),
                            child: Text(
                              'no data founded',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 245, 180, 180)),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(height * 0.02),
                          color: Colors.grey[200],
                          child: Center(
                            child: Column(children: [
                              Center(
                                child: Text(
                                  'Use this form to apply for a re-entry permit, refugee travel document, advance parole travel document (including parole into the U.S. for humanitarian reasons), or advance permission to travel for CNMI long-term residents.',
                                  style: TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Image(
                                        width: 130,
                                        color:
                                            Color.fromARGB(255, 68, 219, 194),
                                        /* GlobalVariables.fromHex('#42C2FF') */
                                        image: AssetImage(
                                            "assets/BROKERLOGOfull2.png"),
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
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(height * 0.02),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5),
                                  //color: GlobalVariables.fromHex('#42C2FF'),
                                ),
                              ],
                            ),
                            child: TextField(
                              //onChanged: searchOptions,
                              onSubmitted: searchOptions,
                              controller: searchFieldController,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 68, 219,
                                      194), /* GlobalVariables.fromHex('#42C2FF'), */
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 68, 219, 194),
                                    /* GlobalVariables.fromHex('#42C2FF'), */
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(width * 0.01),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Search for ',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[300]),
                                ),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 12.0),
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500]),
                                      text: searchFieldController.text,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(width * 0.05),
                                  onPressed: () => {
                                    setState(
                                        () => {searchFieldController.clear()})
                                  },
                                  icon: const Icon(
                                    Icons.highlight_remove,
                                    size: 30,
                                    color: Color.fromARGB(255, 68, 219, 194),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.63,
                          //color: Colors.red,
                          child: FutureBuilder<String>(
                            future: (Item.getDataByCategorie()),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.hasData) {
                                if (SearchResult.isEmpty) {
                                  return const Center(
                                    child: Text('No data found !'),
                                  );
                                } else {
                                  return ListView.builder(
                                    physics: const PageScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: SearchResult.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Item item = SearchResult[index];
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
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 226, 226, 226),
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
                                          width: width * 0.98,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(),
                                                  padding: EdgeInsets.only(
                                                      right: width * 0.02),
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Hero(
                                                        tag: item.image,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
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
                                                              item.price
                                                                  .toString() +
                                                              "/h",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                width: width * 0.5,
                                                //height: height * 0.19,
                                                padding: EdgeInsets.all(
                                                    height * 0.01),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          item.label,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            /*  GlobalVariables.fromHex(
                                                '#42C2FF'), */
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Posted By : ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        Flexible(
                                                          child: RichText(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            strutStyle:
                                                                StrutStyle(
                                                                    fontSize:
                                                                        12.0),
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
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      child: Flexible(
                                                        child: RichText(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          strutStyle:
                                                              StrutStyle(
                                                                  fontSize:
                                                                      12.0),
                                                          text: TextSpan(
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            text: item
                                                                .description,
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
                                                          color: Color.fromARGB(
                                                              255,
                                                              68,
                                                              219,
                                                              194),
                                                          /*  GlobalVariables
                                                                        .fromHex(
                                                                            '#42C2FF'), */
                                                          size: 15,
                                                        ),
                                                        Flexible(
                                                          child: RichText(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            strutStyle:
                                                                StrutStyle(
                                                                    fontSize:
                                                                        12.0),
                                                            text: TextSpan(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              text:
                                                                  item.address,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .bed_rounded,
                                                                color: Colors
                                                                    .grey[400],
                                                                size: 15,
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                item.rooms,
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .grey),
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
                                                                    .bathtub_outlined,
                                                                color: Colors
                                                                    .grey[400],
                                                                size: 15,
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                item.bathrooms,
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .grey,
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
                                                                color: Colors
                                                                    .grey[400],
                                                                size: 15,
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                item.large +
                                                                    ' m2',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
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
                        Container(
                          padding: EdgeInsets.all(height * 0.02),
                          color: Colors.grey[200],
                          child: Center(
                            child: Column(children: [
                              Center(
                                child: Text(
                                  'Use this form to apply for a re-entry permit, refugee travel document, advance parole travel document (including parole into the U.S. for humanitarian reasons), or advance permission to travel for CNMI long-term residents.',
                                  style: TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Image(
                                        width: 130,
                                        color:
                                            Color.fromARGB(255, 68, 219, 194),
                                        /* GlobalVariables.fromHex('#42C2FF') */
                                        image: AssetImage(
                                            "assets/BROKERLOGOfull2.png"),
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
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
