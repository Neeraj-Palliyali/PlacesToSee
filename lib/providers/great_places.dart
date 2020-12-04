import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:PlacesApp/models/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String pickedtitle,
    File pickedimage,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedtitle,
        location: null,
        image: pickedimage);
    _items.add(newPlace);
    notifyListeners();
  }
}
