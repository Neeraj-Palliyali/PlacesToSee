import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/add_place_screen.dart';

import 'providers/great_places.dart';
import 'screens/places_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlaces(),
      child: MaterialApp(
        title: 'Greate Places',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData.dark(),
      ),
    );
  }
}
