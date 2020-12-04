import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:PlacesApp/models/place.dart';

import 'package:PlacesApp/helpers/db_helper.dart';

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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image'])))
        .toList();

    notifyListeners();
  }
}
