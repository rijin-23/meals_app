import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawerWidget.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilter;
  final Map<String, bool> currentFilter;
  FilterScreen(this.currentFilter, this.setFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;

  bool _vegan = false;

  bool _vegetarian = false;

  bool _lactoseFree = false;

  Widget _switchBuilder(String title, String description, bool prevValue,
      Function onSwitchChanged) {
    return SwitchListTile(
        value: prevValue,
        title: Text(title),
        subtitle: Text(description),
        onChanged: onSwitchChanged);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: [
            FlatButton(
              onPressed: () {
                Map<String, bool> passFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.setFilter(passFilters);
              },
              child: Icon(Icons.save, color: Colors.white),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Filter your choice',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 25),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: ListView(
                children: [
                  _switchBuilder(
                      'Gluten-Free',
                      'Only show Gluten-Free food items',
                      _glutenFree, (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                      print(_glutenFree);
                    });
                  }),
                  _switchBuilder(
                      'Lactose-Free',
                      'Only show Lactose-Free food items',
                      _lactoseFree, (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }),
                  _switchBuilder('Vegan', 'Only show Vegan food items', _vegan,
                      (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
                  _switchBuilder('Vegetarian',
                      'Only show Vegetarian food items', _vegetarian, (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
