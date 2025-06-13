import 'package:flutter/material.dart';
import 'package:uni_places/domain/place.dart';
import 'package:uni_places/screens/add_place_screen.dart';
import 'package:uni_places/widgets/places_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Lugares de la UNSIJ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_home),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddPlaceScreen()));
            },
          ),
        ],
      ),
      body: PlacesList(
        places: [
          Place(name: "Cafeteria"),
          Place(name: "Cubo de Alberto"),
          Place(name: "Redes"),
          Place(name: "La negra"),
        ],
      ),
    );
  }
}
