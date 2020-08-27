import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

// ignore: camel_case_types
class Item_Screen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  Item_Screen(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.affordability,
      @required this.complexity});

  void selectItem() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.grey.withOpacity(0.5),
      onTap: selectItem,
      child: Card(
        margin: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        width: 300,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Montserrat'),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
