import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_places/providers/places_provider.dart';
import 'package:uni_places/domain/place.dart';
import 'package:uni_places/widgets/photo_picker.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _nameController = TextEditingController();
  File? _photo;
  void onPickedPhoto(File photo) {
    _photo = photo;
  }

  void _addToPlaces() {
    final enteredName = _nameController.text;
    if (enteredName.isNotEmpty && _photo != null) {
      Place newPlace = Place(name: enteredName, photo: _photo!);
      ref.read(placesProvider.notifier).addPlace(newPlace);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar nuevo lugar"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Nombre: "),
              controller: _nameController,
            ),
            SizedBox(height: 20),
            PhotoPicker(onPickedPhoto: onPickedPhoto),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _addToPlaces,
              label: Text("Agregar"),
              icon: Icon(Icons.add_photo_alternate_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
