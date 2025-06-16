import 'package:flutter/material.dart';
import 'package:uni_places/domain/place.dart';

class PlaceInfoScreen extends StatelessWidget {
  const PlaceInfoScreen({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: [Text(place.name)]),
      ),
    );
  }
}
