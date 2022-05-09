import 'package:broker/models/Categories.dart';
import 'package:broker/screens/ItemByCategorie.dart';
import 'package:broker/static/GlobalVariables.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.14, // 0.02+0.02+0.1
      //color: Colors.red,
      child: FutureBuilder<String>(
        future: Categorie.getData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Categories.length,
              itemBuilder: (BuildContext context, int index) {
                Categorie categorie = Categories[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ItemByCategorie(selectedIndex: index,),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (categorie.id == _selectedIndex)
                          ? Color.fromARGB(255, 68, 219, 194)/* GlobalVariables.fromHex('#42C2FF') */
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
                    margin: EdgeInsets.all(width * 0.02),
                    height: width * 0.1,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200),
                            boxShadow: [
                              BoxShadow(
                                color: (categorie.id == _selectedIndex)
                                    ? Color.fromARGB(255, 68, 219, 194)/* GlobalVariables.fromHex('#42C2FF') */
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
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: width * 0.1,
                                    width: width * 0.15,
                                    image: NetworkImage(categorie.image),
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
                          color: (categorie.id == _selectedIndex)
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
    );
  }
}
