import 'package:flutter/material.dart';
import 'package:uni_places/domain/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(child: Text("Todavía no se han agregado lugares :/"));
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, i) => ListTile(title: Text(places[i].name)),
    );
  }
}
