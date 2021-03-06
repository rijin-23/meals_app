import 'package:flutter/material.dart';
import 'package:meals_app/widgets/dummy_data.dart';

// ignore: camel_case_types
class Meal_Details_Screen extends StatelessWidget {
  final Function setFavorite;
  final Function isFav;
  Meal_Details_Screen(this.setFavorite, this.isFav);

  @override
  Widget build(BuildContext context) {
    final String argsId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == argsId;
    });
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pinkAccent),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: Colors.amber[200],
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Theme.of(context).accentColor),
                    bottom: BorderSide(
                        width: 1, color: Theme.of(context).accentColor)),
              ),
              //height: 600,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.amber[500],
                            child: Text('#${(index + 1)}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setFavorite(argsId),
          child: Icon(isFav(argsId) ? Icons.favorite_border : Icons.favorite)),
    );
  }
}
